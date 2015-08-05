export
    LaneCoord

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

function ==(a::LaneCoord, b::LaneCoord)
    a.trackid == b.trackid &&
    a.s == b.s &&
    a.t == b.t &&
    a.z == b.z &&
    a.h == b.h &&
    a.p == b.p &&
    a.r == b.r &&
    a.laneid == b.laneid &&
    a.offset == b.offset
end

show(io::IO, coord::LaneCoord) = @printf(io, "(%d, %.16e, %.16e, %.16e, %.16e, %.16e, %.16e, %d, %.16e)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r, coord.laneid, coord.offset)
print(io::IO, coord::LaneCoord) = @printf(io, "(%d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f, %d, %.3f)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r, coord.laneid, coord.offset)

copy(c::LaneCoord) = LaneCoord(c.trackid, c.s, c.t, c.z, c.h, c.p, c.r, c.laneid, c.offset)
deepcopy(coord::LaneCoord) = copy(coord)
function copy!(dest::LaneCoord, src::LaneCoord)
    dest.trackid = src.trackid
    dest.s = src.s
    dest.t = src.t
    dest.z = src.z
    dest.h = src.h   
    dest.p = src.p
    dest.r = src.r
    dest.laneid = src.laneid
    dest.offset = src.offset
    dest
end

function plus!(a::LaneCoord, b::LaneCoord)
    (ccall( (:lanecoord_plusequal_lanecoord, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function plus!(a::LaneCoord, b::TrackCoord)
    (ccall( (:lanecoord_plusequal_trackcoord, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end


function init!(coord::LaneCoord)
    coord.trackid = 0
    coord.s = 0.0
    coord.t = 0.0
    coord.z = 0.0
    coord.h = 0.0
    coord.p = 0.0
    coord.r = 0.0
    coord.laneid = 0
    coord.offset = 0.0
    coord
end


