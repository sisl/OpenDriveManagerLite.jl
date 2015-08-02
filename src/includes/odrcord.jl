export

print_coord

type Coord
    x::Cdouble;
    y::Cdouble;
    z::Cdouble;
    h::Cdouble;
    p::Cdouble;
    r::Cdouble;

    Deg2Rad::Cdouble; 
    Rad2Deg::Cdouble;

    Coord()=new()
    Coord(x::Real, y::Real, z::Real, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(x, y, z, h, p, r)

    function Coord() 
        coord = new() # create one without setting any values
        finalizer(coord, obj ->begin
            ccall((:freeTrackCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
        end)
        ptr
    end
     function Coord(trackid::Int, s::Real, t::Real, z::Real=0.0, h::Real=0.0, p::Real=0.0, r::Real=0.0)
        coord =  new(x, y, z, h, p, r)
        finalizer(coord, obj ->begin
            ccall((:freeCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
        end)
        ptr
    end

end


function coord_plusequal(a::TrackCoord, b::TrackCoord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end

function get_offset(coord::TrackCoord) 
    ccall((:coord_getX, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end
function get_off(coord::TrackCoord) 
    ccall((:coord_getY, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end
function get_offset(coord::TrackCoord) 
    ccall((:coord_getZ, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end
function get_offset(coord::TrackCoord) 
    ccall((:coord_getH, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end
function get_offset(coord::TrackCoord) 
    ccall((:coord_getP, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end
function get_offset(coord::TrackCoord) 
    ccall((:coord_getR, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return coord->getOffset();
end



set_coord(coord::TrackCoord, value::Int) =
    ccall((:coord_set, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setX_coord(coord::TrackCoord, value::Int) =
    ccall((:coord_setX, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setY_coord(coord::TrackCoord, value::Int) =
    ccall((:coord_setY, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setZ_coord(coord::TrackCoord, value::Int) =
    ccall((:coord_setZ, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setH_coord(coord::TrackCoord, value::Int) =
    ccall((:coord_setH, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setP_coord(coord::TrackCoord, value::Int) =
    ccall((:coord_setP, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setR_coord(coord::TrackCoord, value::Int) =
    ccall((:coord_setR, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

intitialize_lanecoord(coord::TrackCoord) =
    ccall((:coord_init, LIB_ODRMGR), Void, (Ptr{Void},), coord.ptr)
  
print_coord(coord::TrackCoord) =
    ccall((:coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), coord.ptr)
