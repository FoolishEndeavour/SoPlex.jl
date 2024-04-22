
#=
This file is for hacks that should not exist if the generator was better ...

Currently two hacks 
  1. enum promote to int, and
  2. function export.
=#


#= 
There are two classes of enums - those passed by C as the enum, and those passed as Int.
The first class dont need a promote rule, the second do.
The first class ends with "ParamEnum" the second does not.
So this can be automated.

Do *NOT* promote these:
   SoPlex_BoolParamEnum
   SoPlex_IntParamEnum
   SoPlex_RealParamEnum

Do promote the following
=#

# write a for loop to do the following programmatically
# promote_rule(::Type{Int32}, ::Type{T}) where T<:Enum{Int32} = Int32

const _SOPLEX_PROMOTED_ENUMS = Union{
    SoPlex_SenseEnum,
    SoPlex_RepresentationEnum,
    SoPlex_AlgorithmEnum,
    SoPlex_FactorEnum,
    SoPlex_VerbosityEnum,
    SoPlex_SimplifierEmnum,
    SoPlex_ScalarEnum,
    SoPlex_StarterEnum,
    SoPlex_PricerEnum,
    SoPlex_RatioTestEnum,
    SoPlex_SyncModeEnum,
    SoPlex_ReadModeEnum,
    SoPlex_SolveModeEnum,
    SoPlex_CheckModeEnum,
    SoPlex_TimerEnum,
    SoPlex_HyperPricingEnum,
    SoPlex_PolishEnum,
    SoPlex_VarStatusEnum,
    SoPlex_StatusEnum,
    }
promote_rule(::Type{Int32}, ::Type{T}) where T<: _SOPLEX_PROMOTED_ENUMS = Int32

#=
 @TODO C scope enum constants within Enum, Julia scopes them in encloising context
 In this case this means SoPlex module, but name clashes may be introduced
 @FIXME these are not checked for or handled.
=#

# exports
# functions have "SoPlex_" prefix
# dont export common defines which use "SOPLEX_" prefix
const PREFIXES = ["SoPlex_"] 
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end




### 
### collected notes for fixing fixups properly ...
### 



# CLCursor (CLStructDecl) " due to unsupported field: CLCursor (CLEnumDecl) 

# multiple dispatch
# function printobj(ind::Int, node::Union{CLCursor, CLStructDecl, CLCompoundStmt, CLFunctionDecl})


#=
        # custom rewriter
        function rewrite!(dag::ExprDAG)
            replace!(get_nodes(dag)) do node
                filename = normpath(Clang.get_filename(node.cursor))
                if !contains(filename, "LLVMExtra")
                    return ExprNode(node.id, Generators.Skip(), node.cursor, Expr[], node.adj)
                end
                return node
            end
        end
=#



# https://github.com/JuliaGeo/GDAL.jl/blob/master/gen/generator.jl
# is a complicated example that inserts things !!!


#=
function rewrite!(dag::ExprDAG)
    for n in dag.nodes
        if !isa(n.cursor, Clang.CLFunctionDecl)
            continue
        end
        map!(e -> rewrite(e, n.cursor), n.exprs, n.exprs)
    end
end
=#
# nice filter for only function defn
# from https://github.com/JuliaGeo/LibGEOS.jl/blob/master/gen/generator.jl
