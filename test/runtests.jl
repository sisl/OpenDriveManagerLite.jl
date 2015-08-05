using Base.Test
using Lint

# lintpkg("OpenDriveManagerLite")

using OpenDriveManagerLite

@test ccall( (:libexists, OpenDriveManagerLite.LIB_ODRMGR), Bool, ())


include("test_trackcoord.jl")
include("test_odrlanecoord.jl")
include("test_odrcoord.jl")
include("test_odrmanagerlite.jl")