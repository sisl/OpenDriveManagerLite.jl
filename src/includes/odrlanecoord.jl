export
LaneCoord,

track_coord_plusequal,
lane_coord_plusequal,
intitialize_lanecoord,
print_lanecoord

abstract AbstractTrackCoord
type LaneCoord <: AbstractTrackCoord
    trackid::Cint # id of the corresponding track
    s::Cdouble    # distance along the track
    t::Cdouble    # distance perpendicular to the track
    z::Cdouble    # height
    h::Cdouble    # heading [rad]
    p::Cdouble    # pitch [rad]
    r::Cdouble 
    laneid::Cint
    offset::Cdouble

    LaneCoord() = new() # create one without setting any values
    LaneCoord(trackid::Integer, s::Real, t::Real, z::Real = 0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0, laneid::Real=1, offset::Real=0.0 ) =
        new(trackid, s, t, z, h, p, r, laneid, offset)
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

intitialize_lanecoord(coord::LaneCoord) =
    ccall((:lane_coord_initialize, LIB_ODRMGR), Void, (Ptr{Void},), coord)
  
print_lanecoord(coord::TrackCoord) =
    ccall((:lane_coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), coord.ptr)


