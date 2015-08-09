export
    Coord,
    CoordIm,
    AbstractCoord,

    get_dist,
    get_dist2d,
    get_value

abstract AbstractCoord
type Coord <: AbstractCoord
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
type CoordIm <: AbstractCoord
    x::Cdouble
    y::Cdouble
    z::Cdouble
    h::Cdouble
    p::Cdouble
    r::Cdouble

    CoordIm(x::Real, y::Real, z::Real, h::Real=0.0, p::Real=0.0, r::Real=0.0) =
        new(x, y, z, h, p, r)
end

copy(c::Coord) = Coord(c.x, c.y, c.z, c.h, c.p, c.r)
copy(c::CoordIm) = CoordIm(c.x, c.y, c.z, c.h, c.p, c.r)
deepcopy(c::AbstractCoord) = copy(c)
function copy!(dest::Coord, src::AbstractCoord)
    dest.x = src.x
    dest.y = src.y
    dest.z = src.z
    dest.h = src.h
    dest.p = src.p
    dest.r = src.r
    dest
end

Base.convert(::Type{CoordIm}, c::Coord) = CoordIm(c.x, c.y, c.z, c.h, c.p, c.r)
Base.convert(::Type{Coord}, c::CoordIm) = Coord(c.x, c.y, c.z, c.h, c.p, c.r)

function ==(a::AbstractCoord, b::AbstractCoord)
    isapprox(a.x, b.x) &&
    isapprox(a.y, b.y) &&
    isapprox(a.z, b.z) &&
    isapprox(a.h, b.h) &&
    isapprox(a.p, b.p) &&
    isapprox(a.r, b.r)
end

show(io::IO, coord::AbstractCoord) = @printf(io, "(%.16e, %.16e, %.16e, %.16e, %.16e, %.16e)", coord.x, coord.y, coord.z, coord.h, coord.p, coord.r)
print(io::IO, coord::AbstractCoord) = @printf(io, "(%.3f, %.3f, %.3f, %.3f, %.3f, %.3f)", coord.x, coord.y, coord.z, coord.h, coord.p, coord.r)

function get_dist(a::AbstractCoord, b::AbstractCoord)
    (ccall( (:coord_getDist, LIB_ODRMGR), Cdouble, (Ptr{Coord},Ptr{Coord}), 
        pointer_from_objref(a), pointer_from_objref(b)))
end

function get_dist2d(a::AbstractCoord, b::AbstractCoord)
    (ccall( (:coord_getDist2d, LIB_ODRMGR), Cdouble, (Ptr{Coord},Ptr{Coord}), 
        pointer_from_objref(a), pointer_from_objref(b)))
end

function *(a::AbstractCoord, d::Real)
    CoordIm(a.x * d,
              a.y * d,
              a.z * d,
              a.h * d,
              a.p * d,
              a.r * d)
end
function +(a::AbstractCoord, b::AbstractCoord)
    CoordIm(a.x + b.x,
              a.y + b.y,
              a.z + b.z,
              a.h + b.h,
              a.p + b.p,
              a.r + b.r)
end
function -(a::AbstractCoord, b::AbstractCoord)
    CoordIm(a.x - b.x,
              a.y - b.y,
              a.z - b.z,
              a.h - b.h,
              a.p - b.p,
              a.r - b.r)
end

function times!(a::Coord, d::Real)
    a.x *= d
    a.y *= d
    a.z *= d
    a.h *= d
    a.p *= d
    a.r *= d
    a
end
function plus!(a::Coord, b::AbstractCoord)
    a.x += b.x
    a.y += b.y
    a.z += b.z
    a.h += b.h
    a.p += b.p
    a.r += b.r
    a
end
function minus!(a::Coord, b::AbstractCoord)
    a.x -= b.x
    a.y -= b.y
    a.z -= b.z
    a.h -= b.h
    a.p -= b.p
    a.r -= b.r
    a
end
function times!(retval::Coord, a::AbstractCoord, d::Real)
    retval.x = a.x * d
    retval.y = a.y * d
    retval.z = a.z * d
    retval.h = a.h * d
    retval.p = a.p * d
    retval.r = a.r * d
    retval
end
function plus!(retval::Coord, a::AbstractCoord, b::AbstractCoord)
    retval.x = a.x + b.x
    retval.y = a.y + b.y
    retval.z = a.z + b.z
    retval.h = a.h + b.h
    retval.p = a.p + b.p
    retval.r = a.r + b.r
    retval
end
function minus!(retval::Coord, a::AbstractCoord, b::AbstractCoord)
    retval.x = a.x - b.x
    retval.y = a.y - b.y
    retval.z = a.z - b.z
    retval.h = a.h - b.h
    retval.p = a.p - b.p
    retval.r = a.r - b.r
    retval
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

get_value(coord::AbstractCoord) =
    ccall((:coord_getValue, LIB_ODRMGR), Cdouble, (Ptr{Void},), pointer_from_objref(coord))


