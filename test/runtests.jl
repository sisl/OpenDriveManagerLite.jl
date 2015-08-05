using Base.Test

# using Lint
# println("LINTING")
# lintpkg("OpenDriveManagerLite")
# println("DONE LINTING\n")

using OpenDriveManagerLite

@test ccall( (:libexists, OpenDriveManagerLite.LIB_ODRMGR), Bool, ())


# include("test_coord.jl")
# include("test_trackcoord.jl")
# include("test_lanecoord.jl")
include("test_odrmanagerlite.jl")