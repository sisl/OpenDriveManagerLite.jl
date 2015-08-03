export

coord_equal,
coord_multiply,
coord_plus,
coord_subtract,
coord_plusequal,
coord_minusequal,
get_X,
get_Y,
get_Z,
get_H,
get_P,
get_R,
set_coord,
setX_coord,
setY_coord,
setZ_coord,
setH_coord,
setP_coord,
setR_coord,
intitialize_coord,
print_coord,
get_value_coord

type Coord
    x::Cdouble
    y::Cdouble
    z::Cdouble
    h::Cdouble
    p::Cdouble
    r::Cdouble

    Deg2Rad::Cdouble 
    Rad2Deg::Cdouble

    Coord()=new()
    Coord(x::Real, y::Real, z::Real, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(x, y, z, h, p, r)

    function Coord() 
        coord = new() # create one without setting any values
        finalizer(coord, obj ->begin
            ccall((:freeCoord, LIB_ODRMGR), Void, (Ptr{Void},), obj.prt)
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

function coord_equal(a::CoordA, b::CoordB)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_multiply(a::CoordA, b::CoordB)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_plus(a::CoordA, b::CoordB)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_subtract(a::CoordA, b::CoordB)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_plusequal(a::CoordA, b::CoordB)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_minusequal(a::CoordA, b::CoordB)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function get_X(coord::Coord) 
    ptr = ccall((:coord_getX, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return unsafe_load(ptr, 1)::Double
end
function get_Y(coord::Coord) 
     ptr = ccall((:coord_getY, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return unsafe_load(ptr, 1)::Double
end
function get_Z(coord::Coord) 
     ptr = ccall((:coord_getZ, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return unsafe_load(ptr, 1)::Double
end
function get_H(coord::Coord) 
     ptr = ccall((:coord_getH, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return unsafe_load(ptr, 1)::Double
end
function get_P(coord::Coord) 
     ptr = ccall((:coord_getP, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return unsafe_load(ptr, 1)::Double
end
function get_R(coord::Coord) 
    ptr = ccall((:coord_getR, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    return unsafe_load(ptr, 1)::Double
end

set_coord(coord::Coord, value::Int) =
    ccall((:coord_set, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setX_coord(coord::Coord, value::Int) =
    ccall((:coord_setX, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setY_coord(coord::Coord, value::Int) =
    ccall((:coord_setY, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setZ_coord(coord::Coord, value::Int) =
    ccall((:coord_setZ, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setH_coord(coord::Coord, value::Int) =
    ccall((:coord_setH, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setP_coord(coord::Coord, value::Int) =
    ccall((:coord_setP, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

setR_coord(coord::Coord, value::Int) =
    ccall((:coord_setR, LIB_ODRMGR), Void, (Ptr{Void}, Ptr{Integer}), coord.ptr, value)

intitialize_coord(coord::Coord) =
    ccall((:coord_init, LIB_ODRMGR), Void, (Ptr{Void},), coord.ptr)
  
print_coord(coord::Coord) =
    ccall((:coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), coord.ptr)

get_value_coord(coord::Coord) =
    ccall((:coord_getValue, LIB_ODRMGR), Double, (Ptr{Void},), coord.ptr)
    