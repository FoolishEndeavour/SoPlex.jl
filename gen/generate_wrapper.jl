import Clang
using Clang.Generators
using Clang.LibClang.Clang_jll

# from JuliaGeo example used for rewriting ...
using MacroTools: @capture, postwalk, prettify

# defensive, should be unecessary
cd(@__DIR__)

# a private API is risky, but Pkg package does not provide a quiet way
const hasSoPlex = (Base.find_package("SoPlex_jll") !== nothing)
if hasSoPlex
    import SoPlex_jll
end

src_dir = get(ENV, "SOPLEX_SRC_DIR", "")
if length(src_dir) > 0 then
    if !isdir(src_dir)
        error("SOPLEX_SRC_DIR ($(src_dir)) is not an accessible directory.")
    end
    src_dir = joinpath(SOPLEX_SRC, "src")
    if !isdir(src_dir)
        error("\'src\' subdirectory of SOPLEX_SRC_DIR ($(src_dir)) is not an accessible directory.")
    end
end

if length(src_dir) == 0 
    if !hasSoPlex
        error("Unable to locate SOPLEX_SRC_DIR.\nTry running \'import Pkg; Pkg.add(\"SoPlex_jll\")\'.")
    else
        src_dir = joinpath(SoPlex_jll.artifact_dir, "include")
        if !isdir(src_dir)
            error("Unable to locate source include files in SoPlex_jll package.")
        end
    end
end

const SOPLEX_SRC = src_dir
@assert ispath(SOPLEX_SRC)

# need config as it indicates presence of rational
config_header = joinpath(SOPLEX_SRC, "soplex", "config.h") |> normpath
@assert isfile(config_header)

enumerations_header = joinpath(SOPLEX_SRC, "soplex_enumerations.h") |> normpath
@assert isfile(enumerations_header)

interface_header = joinpath(SOPLEX_SRC, "soplex_interface.h") |> normpath
@assert isfile(interface_header)

# nice to use broadcast with joinpath when header list grows
headers=[enumerations_header, interface_header, config_header]

args = get_default_args()
push!(args, "-I$SOPLEX_SRC")
# push!(args, "-I$SOPLEX_SRC/include")
# push!(args, "-I$SOPLEX_SRC/include/soplex")

options = load_options(joinpath(@__DIR__, "generator.toml"))

ctx = create_context(headers, args, options)


# custom rewriter
function rewrite!(ex::Expr)
    if ! Meta.isexpr(ex, :function) 
        return ex
    end
    # this only trewrites name in julia side of function
    for a in ex.args
        local len = length(a.args)
        for i = 2 : len
            if a.args[i] === :soplex
                a.args[i] = :spxSolver
            end
        end
    end
    return ex
end

function rewrite!(dag::ExprDAG)
    for node in get_nodes(dag)
        for expr in get_exprs(node)
            rewrite!(expr)
        end
    end
end

# build!(ctx)
# implement a rewrite to get consistent naming then replace build with following
# example JuliaGeo/Proj.jl is an example
# importantly soplex.h/.cpp uses "soplex" as variable name which clashes so we need to rename it
build!(ctx, BUILDSTAGE_NO_PRINTING)
# its bnuggy
# rewrite!(ctx.dag)
build!(ctx, BUILDSTAGE_PRINTING_ONLY)

# TODO: will need to add all messy detail of low level interface from "soplex.h" 





