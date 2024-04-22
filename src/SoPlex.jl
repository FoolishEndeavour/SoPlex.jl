module SoPlex

const deps_file = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(deps_file)
    include(deps_file)
else
    error("SoPlex not properly installed. Please run import Pkg; Pkg.build(\"SoPlex\")")
end


# this code uses C strings too much :(
Base.@assume_effects :total function strcmp(a::Cstring, b::String)
    Int(sign(ccall(:strcmp, Int32, (Cstring, Cstring), a, b)))
end


include("commons.jl")
include("ctypes.jl")

#include("soplex_interface.jl")
include("generated_soplex_common.jl")
include("generated_soplex_api.jl")

include("wrapper_fixups.jl")

# this uses function prefix and will be exported
const SoPlex_Supports_Rational = (@isdefined SOPLEX_WITH_GMP) && (@isdefined SOPLEX_WITH_BOOST)

include("MOI_wrapper/MOI_wrapper.jl")

end # module
