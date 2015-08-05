export
    TrackCoord,

    plus!,
    copy,
    deepcopy,
    copy!,
    show,
    print,
    initialize!,
    vires_print2

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


function plus!(a::TrackCoord, b::TrackCoord)
    (ccall( (:trackcoord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end

Base.copy(coord::TrackCoord) = TrackCoord(coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r) # FINISH
Base.deepcopy(coord::TrackCoord) = copy(coord)

function Base.copy!(dest::TrackCoord, src::TrackCoord)
    dest.trackid = src.trackid
    dest.s = src.s
    dest.t = src.t
    dest.z = src.z
    dest.h = src.h   
    dest.p = src.p
    dest.r = src.r
    dest
end

Base.show(io::IO, coord::TrackCoord) = @printf(io, "(%d, %.16e, %.16e, %.16e, %.16e, %.16e, %.16e)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r)
Base.print(io::IO, coord::TrackCoord) = @printf(io, "(%d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r)

function initialize!(coord::TrackCoord)
    coord.trackid = 0
    coord.s = 0.0
    coord.t = 0.0
    coord.z = 0.0
    coord.h = 0.0
    coord.p = 0.0
    coord.r = 0.0
    coord
end

vires_print2(coord::TrackCoord) =
    ccall((:trackcoord_print, LIB_ODRMGR), Void, (Ptr{Void},), &coord)
