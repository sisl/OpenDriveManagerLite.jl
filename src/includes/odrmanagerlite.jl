
type OdrManagerLite
    ptr::Ptr{Void}
    
    function OdrManagerLite()
        ptr = ccall( (:createOdrManagerLite, LIB_ODRMGR), Ptr{Void}, () )
        odrmanager = new(ptr)
        finalizer(odrmanager, obj -> begin
            ccall( (:freeOdrManagerLite, LIB_ODRMGR), Void, (Ptr{Void},), obj.ptr )
        end)
        odrmanager
    end
end

loadfile(mgr::OdrManagerLite, name::AbstractString) =
    ccall( (:odr_manager_loadFile, LIB_ODRMGR), Bool, (Ptr{Void}, Ptr{UInt8}), mgr.ptr, name)

printdata(mgr::OdrManagerLite) =
    ccall((:odr_manager_printData, LIB_ODRMGR), Void, (Ptr{Void},), mgr.ptr )