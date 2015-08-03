export
    TrackCoord,

    plus!,
    copy,
    deepcopy,
    copy!,
    show,
    print,
    get_trackid,
    get_S,
    get_T,
    get_Z,
    get_H,
    get_P,
    get_R,
    set_trackid,
    set_S,
    se_T,
    set_Z,
    set_H,
    set_P,
    set_R,
    initialize,
    print_track_coord



type TrackCoord
    trackid::Cint # id of the corresponding track
    s::Cdouble    # distance along the track
    t::Cdouble    # distance perpendicular to the track
    z::Cdouble    # height
    h::Cdouble    # heading [rad]
    p::Cdouble    # pitch [rad]
    r::Cdouble    # roll [rad]

    # TrackCoord() = new() # create one without setting any values
    # TrackCoord(trackid::Int, s::Real, t::Real, z::Real=0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
    #     new(trackid, s, t, z, h, p, r)

 #TODO(Deon) check this part 
    function TrackCoord() 
        trackcoord = new() # create one without setting any values
        finalizer(trackcoord, obj ->begin
            ccall((:freeTrackCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
        end)
        trackcoord
    end
     function TrackCoord(trackid::Int, s::Real, t::Real, z::Real=0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0)
        trackcoord =  new(trackid, s, t, z, h, p, r)
        finalizer(trackcoord, obj ->begin
            ccall((:freeTrackCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
        end)
        trackcoord
    end

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
end

Base.show(io::IO, coord::TrackCoord) = @printf(io, "(%d, %.16e, %.16e, %.16e, %.16e, %.16e, %.16e)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r)
Base.print(io::IO, coord::TrackCoord) = @printf(io, "(%d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f)", coord.trackid, coord.s, coord.t, coord.z, coord.h, coord.p, coord.r)

function get_trackid(coord::TrackCoord)
    ccall((:track_coord_getTrackId, LIB_ODRMGR), Int, (Ptr{Void},), coord.ptr)
    return coord->getS();
end
function get_S(coord::TrackCoord) 
    ccall((:track_coord_getS, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getS();
end

function get_T(coord::TrackCoord) 
    ccall((:track_coord_getT, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getT();
end

function get_Z(coord::TrackCoord) 
    ccall((:track_coord_getZ, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getZ();
end
function get_H(coord::TrackCoord) 
    ccall((:track_coord_getH, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getH();
end
function get_P(coord::TrackCoord) 
    ccall((:track_coord_getP, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getP();
end
function get_R(coord::TrackCoord) 
    ccall((:track_coord_getR, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getR();
end

set_trackid(coord::TrackCoord, value::Cint) =
    ccall((:track_coord_setS, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Int}), coord.ptr, value)

set_S(coord::TrackCoord, value::Cdouble) =
    ccall((:track_coord_setS, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Double}), coord.ptr, value)

set_T(coord::TrackCoord, value::Cdouble) =
    ccall((:track_coord_setT, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Double}), coord.ptr, value)

set_Z(coord::TrackCoord, value::Cdouble) =
    ccall((:track_coord_setZ, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Double}), coord.ptr, value)

set_H(coord::TrackCoord, value::Cdouble) =
    ccall((:track_coord_setH, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Double}), coord.ptr, value)

set_P(coord::TrackCoord, value::Cdouble) =
    ccall((:track_coord_setP, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Double}), coord.ptr, value)

set_R(coord::TrackCoord, value::Cdouble) =
    ccall((:track_coord_setR, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Double}), coord.ptr, value)

initialize(coord::TrackCoord) =
    ccall((:track_coord_init, LIB_ODRMGR), Void, (Ptr{Void},), coord.ptr)

print_track_coord(coord::TrackCoord) =
    ccall((:track_coord_print, LIB_ODRMGR), Void, (Ptr{Void},), coord.ptr)
