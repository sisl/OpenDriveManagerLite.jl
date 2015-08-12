export
    AbstractTrackCoord,
    
    TrackCoord,
    TrackCoordIm

abstract AbstractTrackCoord
type TrackCoord <: AbstractTrackCoord

    trackid::Cint # id of the corresponding track
    s::Cdouble    # distance along the track
    t::Cdouble    # distance perpendicular to the track
    z::Cdouble    # height
    h::Cdouble    # heading [rad]
    p::Cdouble    # pitch [rad]
    r::Cdouble    # roll [rad]

    TrackCoord() = new() # create one without setting any values
    TrackCoord(trackid::Integer, s::Real, t::Real, z::Real=0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(trackid, s, t, z, h, p, r)
end
immutable TrackCoordIm <: AbstractTrackCoord

    trackid::Cint # id of the corresponding track
    s::Cdouble    # distance along the track
    t::Cdouble    # distance perpendicular to the track
    z::Cdouble    # height
    h::Cdouble    # heading [rad]
    p::Cdouble    # pitch [rad]
    r::Cdouble    # roll [rad]

    TrackCoordIm() = new() # create one without setting any values
    TrackCoordIm(trackid::Integer, s::Real, t::Real, z::Real=0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(trackid, s, t, z, h, p, r)
end

Base.convert(::Type{TrackCoordIm}, c::TrackCoord) = TrackCoordIm(c.s, c.t, c.z, c.h, c.p, c.r)
Base.convert(::Type{TrackCoord}, c::TrackCoordIm) = TrackCoord(c.s, c.t, c.z, c.h, c.p, c.r)

function ==(a::TrackCoord, b::TrackCoord)
    a.trackid == b.trackid &&
    a.s == b.s &&
    a.t == b.t &&
    a.z == b.z &&
    a.h == b.h &&
    a.p == b.p &&
    a.r == b.r
end

show(io::IO, coord::TrackCoord) = @printf(io, "(%d, %.16e, %.16e, %.16e, %.16e, %.16e, %.16e)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r)
print(io::IO, coord::TrackCoord) = @printf(io, "(%d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r)

copy(coord::TrackCoord) = TrackCoord(coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r) # FINISH
deepcopy(coord::TrackCoord) = copy(coord)
function copy!(dest::TrackCoord, src::TrackCoord)
    dest.trackid = src.trackid
    dest.s = src.s
    dest.t = src.t
    dest.z = src.z
    dest.h = src.h   
    dest.p = src.p
    dest.r = src.r
    dest
end

function init!(coord::TrackCoord)
    coord.trackid = 0
    coord.s = 0.0
    coord.t = 0.0
    coord.z = 0.0
    coord.h = 0.0
    coord.p = 0.0
    coord.r = 0.0
    coord
end
function plus!(a::TrackCoord, b::TrackCoord)
    (ccall( (:trackcoord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
       pointer_from_objref(a), pointer_from_objref(b)))
    a 
end

# print_trackcoord(coord::TrackCoord) =
#     ccall((:trackcoord_print, LIB_ODRMGR), Void, (Ptr{Void},), pointer_from_objref(coord))
