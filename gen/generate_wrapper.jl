using Clang

const HEADER_BASE = "/usr/include"

# a private API is risky, but Pkg package does not provide a quiet way
const hasSCIP = (Base.find_package("SCIP_jll") !== nothing)
if hasSCIP
    import SCIP_jll
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
    if !hasSCIP
        error("Unable to locate SOPLEX_SRC_DIR.\nTry running \'import Pkg; Pkg.add(\"SCIP_jll\")\'.")
    else
        src_dir = joinpath(dirname(SCIP_jll.libsoplex), "..", "include")
        if !isdir(src_dir)
            error("Unable to locate source include files in SCIP_jll package.")
        end
    end
end

const SOPLEX_SRC = src_dir
@assert ispath(SOPLEX_SRC)

soplex_header = joinpath(SOPLEX_SRC, "soplex_interface.h")
@assert isfile(soplex_header)

context = Clang.init(
    headers=[soplex_header],
    common_file="commons.jl",
    output_dir=joinpath(@__DIR__, "../src/"),
    clang_includes=vcat(HEADER_BASE, Clang.LLVM_INCLUDE),
    clang_args = ["-I", HEADER_BASE],
    clang_diagnostics=true,
    header_wrapped=(header, cursorname) -> header == cursorname,
    header_library=header_name -> "libsoplex"
)
Clang.run(context)

rm(joinpath(@__DIR__, "..", "src", "LibTemplate.jl"))
