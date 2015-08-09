export
    AbstractLaneCoord,
    LaneCoord,
    LaneCoordIm

abstract AbstractLaneCoord <: AbstractTrackCoord
type LaneCoord <: AbstractLaneCoord
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
immutable LaneCoordIm <: AbstractLaneCoord
    trackid::Cint # id of the corresponding track
    s::Cdouble    # distance along the track
    t::Cdouble    # distance perpendicular to the track
    z::Cdouble    # height
    h::Cdouble    # heading [rad]
    p::Cdouble    # pitch [rad]
    r::Cdouble 
    laneid::Cint
    offset::Cdouble

    LaneCoordIm(trackid::Integer, s::Real, t::Real, z::Real = 0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0, laneid::Real=1, offset::Real=0.0 ) =
        new(trackid, s, t, z, h, p, r, laneid, offset)    
end

function ==(a::AbstractLaneCoord, b::AbstractLaneCoord)
    a.trackid == b.trackid &&
    isapprox(a.s, b.s) &&
    isapprox(a.t, b.t) &&
    isapprox(a.z, b.z) &&
    isapprox(a.h, b.h) &&
    isapprox(a.p, b.p) &&
    isapprox(a.r, b.r) &&
    a.laneid == b.laneid &&
    isapprox(a.offset, b.offset)
end

function show(io::IO, coord::AbstractLaneCoord)
    @printf(io, "(%d, %.16e, %.16e, %.16e, %.16e, %.16e, %.16e, %d, %.16e)", 
                  coord.trackid, coord.s, coord.t, coord.z, 
                  coord.h, coord.p, coord.r, coord.laneid, coord.offset)
end
function print(io::IO, coord::AbstractLaneCoord)
    @printf(io, "(%d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f, %d, %.3f)",
                  coord.trackid, coord.s, coord.t, coord.z, 
                  coord.h, coord.p, coord.r, coord.laneid, coord.offset)
end

copy(c::LaneCoord) = LaneCoord(c.trackid, c.s, c.t, c.z, c.h, c.p, c.r, c.laneid, c.offset)
copy(c::LaneCoordIm) = LaneCoordIm(c.trackid, c.s, c.t, c.z, c.h, c.p, c.r, c.laneid, c.offset)
deepcopy(coord::AbstractLaneCoord) = copy(coord)

function copy!(dest::LaneCoord, src::AbstractLaneCoord)
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

function plus!(a::LaneCoord, b::AbstractLaneCoord)
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


