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

    LaneCoord() = new() # create one without setting any values
    	   
	LaneCoord(track::Integer, lane::Integer, s::Real, offset::Real = 0.0 ) =
	    new(trackid, s, t, z, h, p, r)
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
    ccall((:lane_coord_get_laneid, LIB_ODRMGR), Integer, (Ptr{Void},), coord.ptr)
    return coord->getLaneId();
end
function get_offset(coord::TrackCoord) 
    ccall((:lane_coord_get_offset, LIB_ODRMGR), Real, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end
set_laneid(coord::TrackCoord, value::Integer) =
    ccall((:lane_coord_set_laneid, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

set_offset(coord::TrackCoord, value::Real) =
    ccall((:lane_coord_set_offset, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Real}), coord.ptr, value)

intitialize_lanecoord(coord::TrackCoord) =
    ccall((:lane_coord_initialize, LIB_ODRMGR), Void, (Ptr{Void},), coord.ptr)
  
print_lanecoord(coord::TrackCoord) =
    ccall((:lane_coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), coord.ptr)


