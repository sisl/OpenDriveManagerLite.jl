export
    OdrManagerLite,
    Position,

    loadfile,
    printdata,
    create_position,
    activate_position,

    get_trackpos,
    get_lanepos,
    get_inertialpos,
    get_footpoint,

    set_pos,
    set_trackpos,
    set_lanepos,
    set_inertialpos,

    track2inertial,
    inertial2track,
    lane2inertial,
    inertial2lane,
    footpoint2inertial,

    print_odrmanagerlite,
    get_curvature,
    get_track_len,
    get_lane_width

type OdrManagerLite
    ptr::Ptr{Void}
    has_activated_position::Bool
    
    function OdrManagerLite()
        ptr = ccall( (:createOdrManagerLite, LIB_ODRMGR), Ptr{Void}, () )
        odrmanager = new(ptr, false)
        finalizer(odrmanager, obj -> begin
            ccall( (:free_OdrManagerLite, LIB_ODRMGR), Void, (Ptr{Void},), obj.ptr )
        end)
        odrmanager
    end
end

type Position
    ptr::Ptr{Void}
    Position(ptr::Ptr{Void}) = new(ptr)
end

loadfile(mgr::OdrManagerLite, name::String) =
    ccall((:odr_manager_loadFile, LIB_ODRMGR), Bool, (Ptr{Void}, Ptr{UInt8}), mgr.ptr, name)

printdata(mgr::OdrManagerLite) =
    ccall((:odr_manager_printData, LIB_ODRMGR), Void, (Ptr{Void},), mgr.ptr )

function create_position(mgr::OdrManagerLite)
    mgr.has_activated_position = true
    ptr = ccall((:odr_manager_createPosition, LIB_ODRMGR), Ptr{Void}, (Ptr{Void},), mgr.ptr)
    Position(ptr)
end

function activate_position(mgr::OdrManagerLite, pos::Position)
    mgr.has_activated_position = true
    ccall((:odr_manager_activatePosition, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Position}), mgr.ptr, pos.ptr)
end

function get_trackpos(mgr::OdrManagerLite)
    if !mgr.has_activated_position
        warn("OdrManagerLite does not have an activated position")
    else
        coord = TrackCoord()
        ccall((:odr_manager_getTrackPos, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), mgr.ptr, pointer_from_objref(coord))
        return coord
    end
end
function get_lanepos(mgr::OdrManagerLite)
    if !mgr.has_activated_position
        warn("OdrManagerLite does not have an activated position")
    else
        coord = LaneCoord()
        ccall((:odr_manager_getLanePos, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), mgr.ptr, pointer_from_objref(coord))
        return coord
    end
end
function get_inertialpos(mgr::OdrManagerLite)
    if !mgr.has_activated_position
        warn("OdrManagerLite does not have an activated position")
    else
        coord = Coord()
        ccall((:odr_manager_getInertialPos, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), mgr.ptr, pointer_from_objref(coord))
        return coord
    end
end
function get_footpoint(mgr::OdrManagerLite)
    if !mgr.has_activated_position
        warn("OdrManagerLite does not have an activated position")
    else
        coord = Coord()
        ccall((:odr_manager_getFootPoint, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), mgr.ptr, pointer_from_objref(coord))
        return coord
    end
end

set_pos(mgr::OdrManagerLite, value::TrackCoord) =
    ccall((:odr_manager_setpos_track_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{TrackCoord}), mgr.ptr, pointer_from_objref(value))
set_pos(mgr::OdrManagerLite, value::LaneCoord) =
    ccall((:odr_manager_setpos_lane_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{LaneCoord}), mgr.ptr, pointer_from_objref(value))
set_pos(mgr::OdrManagerLite, value::Coord) =
    ccall((:odr_manager_setpos_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Coord}), mgr.ptr, pointer_from_objref(value))

set_trackpos(mgr::OdrManagerLite, value::TrackCoord) =
    ccall((:odr_manager_set_track_pos_track_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{TrackCoord}), mgr.ptr, pointer_from_objref(value))
set_trackpos(mgr::OdrManagerLite, id::Integer, s::Real, t::Real=0.0) =
    ccall((:odr_manager_set_track_pos_s_t, LIB_ODRMGR), Void, (Ptr{Void}, Cint, Cdouble, Cdouble), mgr.ptr, id, s, t)

set_lanepos(mgr::OdrManagerLite, value::LaneCoord) =
    ccall((:odr_manager_setLanePos_with_lanecoord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{LaneCoord}), mgr.ptr, pointer_from_objref(value))
set_lanepos(mgr::OdrManagerLite, trackId::Integer, laneId::Integer, s::Real, offset::Real=0.0) =
    ccall((:odr_manager_setLanePos, LIB_ODRMGR), Void, (Ptr{Void}, Cint, Cint, Cdouble, Cdouble), mgr.ptr, trackId, laneId, s, offset)

set_inertialpos(mgr::OdrManagerLite, x::Real, y::Real, z::Real) =
    ccall((:odr_manager_setInertialPos, LIB_ODRMGR), Void, (Ptr{Void}, Cdouble, Cdouble, Cdouble), mgr.ptr, x, y, z)

track2inertial(mgr::OdrManagerLite) = 
     ccall((:odr_manager_track2inertial, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

inertial2track(mgr::OdrManagerLite) = 
     ccall((:odr_manager_inertial2track, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

lane2inertial(mgr::OdrManagerLite) = 
     ccall((:odr_manager_lane2inertial, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

inertial2lane(mgr::OdrManagerLite) = 
     ccall((:odr_manager_inertial2lane, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

footpoint2inertial(mgr::OdrManagerLite) = 
    ccall((:odr_manager_footPoint2inertial, LIB_ODRMGR), Void, (Ptr{Void},), mgr.ptr)

print_odrmanagerlite(mgr::OdrManagerLite, indent::Integer=0) = 
    ccall((:odr_manager_print, LIB_ODRMGR), Void, (Ptr{Void},Cint), mgr.ptr, indent)

get_curvature(mgr::OdrManagerLite) = 
     ccall((:odr_manager_getCurvature, LIB_ODRMGR), Cdouble, (Ptr{Void},), mgr.ptr)
    
get_track_len(mgr::OdrManagerLite, trackId::Integer) =
    ccall((:odr_manager_getTrackLen, LIB_ODRMGR), Cdouble, (Ptr{Void}, Cint), mgr.ptr, trackId)

get_lane_width(mgr::OdrManagerLite) =
    ccall((:odr_manager_getLaneWidth, LIB_ODRMGR), Cdouble, (Ptr{Void},), mgr.ptr)

