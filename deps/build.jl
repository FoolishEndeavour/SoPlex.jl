import Libdl

# SoPlex.jl depends on the artifacts from SoPlex_jll.jl (which includes the soplex solver)

# a private API is risky, but Pkg package does not provide a quiet way
_hasSoPlex = (Base.find_package("SoPlex_jll") !== nothing)

# if user set environment variables to specific installs we dont require SoPlex_jll
if !_hasSoPlex
    error("Unable to locate SoPlex Binary Artifact.\nTry running \'import Pkg; Pkg.add(\"SoPlex_jll\")\'.")
elseif Sys.iswindows()
    @warn("SoPlex_jll (includes soplex.dll) still doesn't work with windows, segfaults are likely!")
end

import SoPlex_jll
if !isfile(SoPlex_jll.libsoplex_library)
    error("Fatal Error: Inaccessible SoPlex Binary Artifact.\nTry reinstalling SoPlex_jll.\n")
end

# remove previous/old dependency specification
here = dirname(@__FILE__)
depsfile = joinpath(here, "deps.jl")
if isfile(depsfile)
    rm(depsfile)
end
# create new dependency specification
open(depsfile, "w") do f
    print(f, "const libsoplex_library = \"$(SoPlex_jll.libsoplex_library)\"")
    println(f)
end
