export
LaneCoord,

track_coord_plusequal,
lane_coord_plusequal,
get_laneid,
get_offset,
set_laneid,
set_offset,
intitialize_lanecoord,
print_lanecoord

type LaneCoord
	laneid::Cint
    offset::Cdouble

	function LaneCoord() 
	    lanecoord = new() # create one without setting any values
	    finalizer(trackcoord, obj ->begin
	        ccall((:freeLaneCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
	    end)
	        lanecoord
	end
	function LaneCoord(track::Int, lane::Int, s::double, offset::double = 0.0 )
	    lanecoord =  new(trackid, s, t, z, h, p, r)
	    finalizer(trackcoord, obj ->begin
	        ccall((:freeLaneCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
	    end)
	        lanecoord
    end
end


function track_coord_plusequal(a::TrackCoord, b::TrackCoord)
    (ccall( (:trackcoord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function lane_coord_plusequal(a::LaneCoord, b::LaneCoord)
    (ccall( (:lane_coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end

function get_laneid(coord::TrackCoord) 
    ccall((:lane_coord_get_laneid, LIB_ODRMGR), Int, (Ptr{Void},), coord.ptr)
    return coord->getLaneId();
end
function get_offset(coord::TrackCoord) 
    ccall((:lane_coord_get_offset, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end
set_laneid(coord::TrackCoord, value::Int) =
    ccall((:lane_coord_set_laneid, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

set_offset(coord::TrackCoord, value::Double) =
    ccall((:lane_coord_set_offset, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Double}), coord.ptr, value)

intitialize_lanecoord(coord::TrackCoord) =
    ccall((:lane_coord_initialize, LIB_ODRMGR), Void, (Ptr{Void},), coord.ptr)
  
print_lanecoord(coord::TrackCoord) =
    ccall((:lane_coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), coord.ptr)


