export

coord_equal,
coord_multiply,
coord_plus,
coord_subtract,
coord_plusequal,
coord_minusequal,
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

    Coord()=new()
    Coord(x::Real, y::Real, z::Real, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(x, y, z, h, p, r)

end

function coord_equal(a::Coord, b::Coord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_multiply(a::Coord, b::Coord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_plus(a::Coord, b::Coord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_subtract(a::Coord, b::Coord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_plusequal(a::Coord, b::Coord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_minusequal(a::Coord, b::Coord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end

intitialize_coord(coord::Coord) =
    ccall((:coord_init, LIB_ODRMGR), Void, (Ptr{Void},), coord.ptr)
  
print_coord(coord::Coord) =
    ccall((:coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), coord.ptr)

get_value_coord(coord::Coord) =
    ccall((:coord_getValue, LIB_ODRMGR), Cdouble, (Ptr{Void},), coord.ptr)
    