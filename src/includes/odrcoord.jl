export
    Coord,

    coord_get_dist,
    coord_get_dist2d,
    init!,
    get_value

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

copy(c::Coord) = Coord(c.x, c.y, c.z, c.h, c.p, c.r)
function copy!(dest::Coord, src::Coord)
    dest.x = src.x
    dest.y = src.y
    dest.z = src.z
    dest.h = src.h
    dest.p = src.p
    dest.r = src.r
    dest
end

function coord_get_dist(a::Coord, b::Coord)
    (ccall( (:coord_getDist, LIB_ODRMGR), Cdouble, (Ptr{Coord},Ptr{Coord}), 
        pointer_from_objref(a), pointer_from_objref(b)))
end

function coord_get_dist2d(a::Coord, b::Coord)
    (ccall( (:coord_getDist2d, LIB_ODRMGR), Cdouble, (Ptr{Coord},Ptr{Coord}), 
        pointer_from_objref(a), pointer_from_objref(b)))
end

function ==(a::Coord, b::Coord)
    isapprox(a.x, b.x) &&
    isapprox(a.y, b.y) &&
    isapprox(a.z, b.z) &&
    isapprox(a.h, b.h) &&
    isapprox(a.p, b.p) &&
    isapprox(a.r, b.r) 
end

function *(a::Coord, d::Real)
    c = Coord(a.x * d,
              a.y * d,
              a.z * d,
              a.h * d,
              a.p * d,
              a.r * d)
end
function +(a::Coord, b::Coord)
    c = Coord(a.x + b.x,
              a.y + b.y,
              a.z + b.z,
              a.h + b.h,
              a.p + b.p,
              a.r + b.r)
    # cptr = (ccall( (:coord_plus, LIB_ODRMGR), Ptr{Cdouble}, (Ptr{Void},Ptr{Void}), 
    #     pointer_from_objref(a), pointer_from_objref(b)))
    # retval = Array(Cdouble, 7)
    # for i = 1 : length(retval)
    #     retval[i] = unsafe_load(cptr, i)
    # end
    # retval
    # cptr = (ccall( (:coord_plus, LIB_ODRMGR), Ptr{Coord}, (Ptr{Void},Ptr{Void}), pointer_from_objref(a), pointer_from_objref(b)))
    # unsafe_pointer_to_objref(cptr)::Coord
end
function -(a::Coord, b::Coord)
    c = Coord(a.x - b.x,
              a.y - b.y,
              a.z - b.z,
              a.h - b.h,
              a.p - b.p,
              a.r - b.r)
    # cptr = (ccall( (:coord_subtract, LIB_ODRMGR), Ptr{Void}, (Ptr{Void},Ptr{Void}), 
    #     pointer_from_objref(a), pointer_from_objref(b)))
    # unsafe_load(cptr, 1)::Coord
end

function plus!(a::Coord, b::Coord)
    # (ccall( (:coord_plusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
    #     pointer_from_objref(a), pointer_from_objref(b)))
    a.x += b.x
    a.y += b.y
    a.z += b.z
    a.h += b.h
    a.p += b.p
    a.r += b.r
    a
end

function minus!(a::Coord, b::Coord)
    # (ccall( (:coord_minusequal, LIB_ODRMGR), Void, (Ptr{Void},Ptr{Void}), 
    #     pointer_from_objref(a), pointer_from_objref(b)))
    a.x -= b.x
    a.y -= b.y
    a.z -= b.z
    a.h -= b.h
    a.p -= b.p
    a.r -= b.r
    a
end

function init!(coord::Coord) 
    coord.x = 0.0
    coord.y = 0.0
    coord.z = 0.0
    coord.h = 0.0
    coord.p = 0.0
    coord.r = 0.0
    coord
end

# print_coord(coord::Coord) =
#     ccall((:coord_print, LIB_ODRMGR), Void, (Ptr{Void}, ), pointer_from_objref(coord))

get_value(coord::Coord) =
    ccall((:coord_getValue, LIB_ODRMGR), Cdouble, (Ptr{Void},), pointer_from_objref(coord))
