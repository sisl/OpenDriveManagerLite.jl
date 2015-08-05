export
    Coord,

    coord_get_dist,
    coord_get_dist2d,
    coord_equal,
    coord_multiply,
    coord_plus,
    coord_subtract,
    coord_plusequal,
    coord_minusequal,
    intitialize_coord!,
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

function coord_get_dist(a::Coord, b::Coord)
    (ccall( (:coord_getDist, LIB_ODRMGR), Cdouble, (Ptr{Coord},Ptr{Coord}), 
        pointer_from_objref(a), pointer_from_objref(b)))
end

function coord_get_dist2d(a::Coord, b::Coord)
    (ccall( (:coord_getDist2d, LIB_ODRMGR), Cdouble, (Ptr{Coord},Ptr{Coord}), 
        pointer_from_objref(a), pointer_from_objref(b)))
end

function coord_equal(a::Coord, b::Coord)
    (ccall( (:coord_equal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_multiply(a::Coord, b::Coord)
    (ccall( (:coord_multiply, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_plus(a::Coord, b::Coord)
    (ccall( (:coord_plus, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_subtract(a::Coord, b::Coord)
    (ccall( (:coord_subtract, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_plusequal(a::Coord, b::Coord)
    (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end
function coord_minusequal(a::Coord, b::Coord)
    (ccall( (:coord_minusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
        pointer_from_objref(a), pointer_from_objref(b)))
    a
end

function intitialize_coord!(coord::Coord) 
    coord.s = 0.0
    coord.t = 0.0
    coord.z = 0.0
    coord.h = 0.0
    coord.p = 0.0
    coord.z = 0.0
    coord
end

print_coord(coord::Coord) =
    ccall((:coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), pointer_from_objref(coord))

get_value_coord(coord::Coord) =
    ccall((:coord_getValue, LIB_ODRMGR), Cdouble, (Ptr{Void},), pointer_from_objref(coord))
    