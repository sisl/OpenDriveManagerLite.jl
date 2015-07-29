export
    OdrManagerLite,

    loadfile,
    printdata,
    get_trackpos

type OdrManagerLite
    ptr::Ptr{Void}
    has_activated_position::Bool
    
    function OdrManagerLite()
        ptr = ccall( (:createOdrManagerLite, LIB_ODRMGR), Ptr{Void}, () )
        odrmanager = new(ptr, false)
        finalizer(odrmanager, obj -> begin
            ccall( (:freeOdrManagerLite, LIB_ODRMGR), Void, (Ptr{Void},), obj.ptr )
        end)
        odrmanager
    end
end

type Position
    ptr::Ptr{Void}

    function Position(ptr::Ptr{Void})
        pos = new(ptr)
        finalizer(pos, obj -> begin
            ccall( (:freePosition, LIB_ODRMGR), Void, (Ptr{Void},), obj.ptr )
        end)
        pos 
    end
end

loadfile(mgr::OdrManagerLite, name::AbstractString) =
    ccall( (:odr_manager_loadFile, LIB_ODRMGR), Bool, (Ptr{Void}, Ptr{UInt8}), mgr.ptr, name)

printdata(mgr::OdrManagerLite) =
    ccall((:odr_manager_printData, LIB_ODRMGR), Void, (Ptr{Void},), mgr.ptr )

function activate_position(mgr::OdrManagerLite, pos::Position)
    mgr.has_activated_position = true
    ccall....
end

function get_trackpos(mgr::OdrManagerLite)
    if !mgr.has_activated_position
        warn("OdrManagerLite does not have an activated position")
    else
        ptr = ccall((:odr_manager_getTrackPos, LIB_ODRMGR), Ptr{TrackCoord}, (Ptr{Void},), mgr.ptr )
        return unsafe_load(ptr, 1)::TrackCoord
    end
end