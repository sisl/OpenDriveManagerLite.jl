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
    set_trackpos_s_t,
    set_trackpos_track_coord,
    set_pos_with_lanecoord,
    set_lanepos,
    set_lanepos_with_lanecoord,
    set_pos_with_coord,
    set_inertialpos,
    convert_track_to_inertial,
    convert_inertial_to_track,
    convert_lane_to_inertial,
    print_odrmanagerlite,
    get_curvature,
    get_track_len,
    get_lane_width,
    copy_foot_point_to_inertial

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
        ptr = ccall((:odr_manager_getTrackPos, LIB_ODRMGR), Ptr{TrackCoord}, (Ptr{Void},), mgr.ptr )
        return unsafe_load(ptr, 1)::TrackCoord
    end
end

function get_lanepos(mgr::OdrManagerLite)
    ptr = ccall((:odr_manager_getLanePos, LIB_ODRMGR), Ptr{LaneCoord}, (Ptr{Void},), mgr.ptr )
    return unsafe_load(ptr, 1)::LaneCoord
end

function get_inertialpos(mgr::OdrManagerLite)
    ptr = ccall((:odr_manager_getInertialPos, LIB_ODRMGR), Ptr{Coord}, (Ptr{Void},), mgr.ptr )
    return unsafe_load(ptr, 1)::Coord
end

function get_footpoint(mgr::OdrManagerLite)
    ptr = ccall((:odr_manager_getFootPoint, LIB_ODRMGR), Ptr{Coord}, (Ptr{Void},), mgr.ptr )
    return unsafe_load(ptr, 1)::Coord
end

set_pos(mgr::OdrManagerLite, value::TrackCoord) =
    ccall((:odr_manager_setpos_track_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Void}), mgr.ptr, value.ptr)

set_trackpos_s_t(mgr::OdrManagerLite, id::Cint, s::Cdouble, t::Cdouble=0.0) =
    ccall((:odr_manager_set_track_pos_s_t, LIB_ODRMGR), Void, (Ptr{Void}, Int, Cdouble, Cdouble), mgr.ptr, id, s, t)

set_trackpos_track_coord(mgr::OdrManagerLite, value::TrackCoord) =
    ccall((:odr_manager_set_track_pos_track_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{TrackCoord}), mgr.ptr, value.ptr)

set_pos_with_lanecoord(mgr::OdrManagerLite, value::LaneCoord) =
    ccall((:odr_manager_setpos_lane_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Void}), mgr.ptr, value.ptr)

set_lanepos(mgr::OdrManagerLite, trackId::Cint, laneId::Cint, s::Cdouble, offset::Cdouble=0.0) =
    ccall((:odr_manager_setLanePos, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Int}, Ptr{Int}, Ptr{Cdouble}, Ptr{Cdouble}), mgr.ptr, trackId, laneId, s, offset)

set_lanepos_with_lanecoord(mgr::OdrManagerLite, value::LaneCoord) =
    ccall((:odr_manager_setLanePos_with_lanecoord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Void}), mgr.ptr, value.ptr)

set_pos_with_coord(mgr::OdrManagerLite, value::Coord) =
    ccall((:odr_manager_setpos_coord, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Void}), mgr.ptr, value.ptr)

set_inertialpos(mgr::OdrManagerLite, x::Cdouble, y::Cdouble, z::Cdouble) =
    ccall((:odr_manager_setInertialPos, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), mgr.ptr, x, y, z)

convert_track_to_inertial(mgr::OdrManagerLite) = 
     ccall((:odr_manager_track2inertial, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

convert_inertial_to_track(mgr::OdrManagerLite) = 
     ccall((:odr_manager_inertial2track, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

convert_lane_to_inertial(mgr::OdrManagerLite) = 
     ccall((:odr_manager_lane2inertial, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

convert_inertial_to_lane(mgr::OdrManagerLite) = 
     ccall((:odr_manager_inertial2lane, LIB_ODRMGR), Bool, (Ptr{Void},), mgr.ptr)

print_odrmanagerlite(mgr::OdrManagerLite) = 
    ccall((:odr_manager_print, LIB_ODRMGR), Void, (Ptr{Void},), mgr.ptr)

function get_curvature(mgr::OdrManagerLite)
    ptr = ccall((:odr_manager_getCurvature, LIB_ODRMGR), Cdouble, (Ptr{Void},), mgr.ptr)
    return unsafe_load(ptr, 1)::Cdouble
end

get_track_len(mgr::OdrManagerLite, trackId::Cint) =
    ccall((:odr_manager_getTrackLen, LIB_ODRMGR), Cdouble, (Ptr{Void}, Ptr{Int}), mgr.ptr, trackId)

function get_lane_width(mgr::OdrManagerLite)
    ptr = ccall((:odr_manager_getLaneWidth, LIB_ODRMGR), Cdouble, (Ptr{Void},), mgr.ptr)
    return unsafe_load(ptr, 1)::Cdouble
end

copy_foot_point_to_inertial(mgr::OdrManagerLite) = 
    ccall((:odr_manager_footPoint2inertial, LIB_ODRMGR), Void, (Ptr{Void},), mgr.ptr)

