module OpenDriveManagerLite

using Lint
using Compat

macro lintpragma(s)
end

##############################################################################
##
## Ensure lib can be found
##
##############################################################################
export
    AbstractTrackCoord,

	plus!,
    minus!
	
import Base: copy, copy!, deepcopy, show, print, ==, *, +, -

const LIB_ODRMGR = let
    curpath = dirname(@__FILE__() )
    pathtoadd = curpath[1:end-3]*"deps/downloads/"    
    find_library(["libodrmanjl"], [pathtoadd])
end

if isempty(LIB_ODRMGR)
    warn("Could not communicate with libodrmanjl. Make sure it exists and that it is on the path.")
end
    
include("includes/trackcoord.jl")
include("includes/lanecoord.jl")
include("includes/coord.jl")
include("includes/odrmanagerlite.jl")

end # module
