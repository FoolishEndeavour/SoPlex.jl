import Libdl

# SoPlex.jl depends on the artifacts from SCIP_jll.jl (which includes the soplex solver)

# a private API is risky, but Pkg package does not provide a quiet way
hasSCIP = (Base.find_package("SCIP_jll") !== nothing)

# if user set environment variables to specific installs we dont require SCIP_jll
if !haskey(ENV, "SOPLEX_DIR") && !haskey(ENV, "SCIPOPTDIR")
    if !hasSCIP
        error("Unable to locate either SOPLEX or SCIPOPT installation.\nTry running \'import Pkg; Pkg.add(\"SCIP_jll\")\'.")
    elseif Sys.iswindows()
        @warn("SCIP_jll (includes soplex.dll) still doesn't work with windows, segfaults are likely!")
    end
end

libBasename = "soplex"
libSuffix = if Sys.islinux()
    ".so"
elseif Sys.isapple()
    ".dylib"
elseif Sys.iswindows()
    ".dll"
else
    local boldName = uppercase(libBasename)
    error("\"$(boldName)\" is currently not supported on \"$(Sys.KERNEL)\"")
end
# do all platforms insert "shared" keyword in soplex name ?
libName = libBasename * "shared" * libSuffix

# remove previous/old dependency specification
here = dirname(@__FILE__)
depsfile = joinpath(here, "deps.jl")
if isfile(depsfile)
    rm(depsfile)
end

# code to create new dependency 
function write_depsfile(path)
    varname = "lib" * libBasename
    open(depsfile, "w") do f
        print(f, "const $(varname) = ")
        show(f, path)
        println(f)
    end
end

# priority is to first occurence
paths_to_try = []

# prefer SOPLEX specific environment variable
if haskey(ENV, "SOPLEX_DIR")
    local env_dir = ENV["SOPLEX_DIR"]
    # whilst developing a build directory might be preferred
    push!(paths_to_try, joinpath(env_dir, "build", "bin", libName))
    push!(paths_to_try, joinpath(env_dir, "build", "lib", libName))
    # put build dir first
    push!(paths_to_try, joinpath(env_dir, "bin", libName))
    push!(paths_to_try, joinpath(env_dir, "lib", libName))
end

# next try SCIPOPT environment variable (it includes soplex)
if haskey(ENV, "SCIPOPTDIR")
    local env_dir = ENV["SCIPOPTDIR"]
    push!(paths_to_try, joinpath(env_dir, "bin", libName))
    push!(paths_to_try, joinpath(env_dir, "lib", libName))
end

# but also try library path
push!(paths_to_try, joinpath(here, libName))

# search for first occurence in paths_to_try 
found = false
tried = String[]
for l in paths_to_try
    try
        d = Libdl.dlopen(l)
        global found = true
        write_depsfile(l)
        break
    catch e
        push!(tried, "$(l): $(e.msg)")
    end
end

if !found && hasSCIP
    import SCIP_jll
    local l = SCIP_jll.libsoplex
    try
        d = Libdl.dlopen(l)
        global found = true
        write_depsfile(l)
    catch e
        push!(tried, "$(l): $(e.msg)")
    end
end

if !found && !haskey(ENV, "SCIP_JL_SKIP_LIB_CHECK")
    error("""
Unable to locate either SOPLEX or SCIP installation. Tried:

$(join(tried, "\n\n"))

Note that this must be downloaded separately from https://scipopt.org.
Please set the environment variable SOPLEX_DIR to SoPlex's installation path.
""")
end
