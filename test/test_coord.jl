coord = Coord()
coord = Coord(1.0,2.0,3.0)
@test coord.x == 1.0
@test coord.y == 2.0
@test coord.z == 3.0
@test coord.h == 0.0
@test coord.p == 0.0
@test coord.r == 0.0

coord = Coord(1.0,2.0,3.0,4.0,5.0,6.0)
@test coord.x == 1.0
@test coord.y == 2.0
@test coord.z == 3.0
@test coord.h == 4.0
@test coord.p == 5.0
@test coord.r == 6.0

@test coord == Coord(1.0,2.0,3.0,4.0,5.0,6.0)

coordim = CoordIm(1.0,2.0,3.0)
@test coordim.x == 1.0
@test coordim.y == 2.0
@test coordim.z == 3.0
@test coordim.h == 0.0
@test coordim.p == 0.0
@test coordim.r == 0.0

coordim = CoordIm(1.0,2.0,3.0,4.0,5.0,6.0)
@test coordim.x == 1.0
@test coordim.y == 2.0
@test coordim.z == 3.0
@test coordim.h == 4.0
@test coordim.p == 5.0
@test coordim.r == 6.0

@test coord == coordim
@test coordim == coord
@test coordim == CoordIm(1.0,2.0,3.0,4.0,5.0,6.0)

@test coord == copy(coord)
@test coord == copy(coordim)
@test coord == deepcopy(coord)
@test coord == deepcopy(coordim)
@test copy!(coord, Coord(2.0,3.0,4.0,5.0,6.0,7.0)) == Coord(2.0,3.0,4.0,5.0,6.0,7.0)
@test copy!(coord, CoordIm(2.0,3.0,4.0,5.0,6.0,7.0)) == Coord(2.0,3.0,4.0,5.0,6.0,7.0)

show(coord); print("\n")
println(coord)
show(coordim); print("\n")
println(coordim)

coordA = Coord(1.0,2.0,3.0,4.0,5.0,6.0)
coordB = Coord(1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
@test isapprox(get_dist(coordA, coordA), 0.0)
@test isapprox(get_dist(coordA, coordB), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))
@test isapprox(get_dist(coordB, coordA), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))

@test get_dist2d(coordA, coordA) == 0.0
@test isapprox(get_dist2d(coordA, coordB), norm([coordA.x-coordB.x, coordA.y-coordB.y]))
@test isapprox(get_dist2d(coordB, coordA), norm([coordA.x-coordB.x, coordA.y-coordB.y]))

coordA = CoordIm(1.0,2.0,3.0,4.0,5.0,6.0)
coordB = CoordIm(1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
@test isapprox(get_dist(coordA, coordA), 0.0)
@test isapprox(get_dist(coordA, coordB), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))
@test isapprox(get_dist(coordB, coordA), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))

coordA = CoordIm(1.0,2.0,3.0,4.0,5.0,6.0)
coordB = Coord(1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
@test isapprox(get_dist(coordA, coordA), 0.0)
@test isapprox(get_dist(coordA, coordB), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))
@test isapprox(get_dist(coordB, coordA), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))

@test get_dist2d(coordA, coordA) == 0.0
@test isapprox(get_dist2d(coordA, coordB), norm([coordA.x-coordB.x, coordA.y-coordB.y]))
@test isapprox(get_dist2d(coordB, coordA), norm([coordA.x-coordB.x, coordA.y-coordB.y]))

coordA = Coord(1.0,2.0,3.0,4.0,5.0,6.0)
coordB = CoordIm(1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
@test isapprox(get_dist(coordA, coordA), 0.0)
@test isapprox(get_dist(coordA, coordB), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))
@test isapprox(get_dist(coordB, coordA), norm([coordA.x-coordB.x, coordA.y-coordB.y, coordA.z-coordB.z]))

@test get_dist2d(coordA, coordA) == 0.0
@test isapprox(get_dist2d(coordA, coordB), norm([coordA.x-coordB.x, coordA.y-coordB.y]))
@test isapprox(get_dist2d(coordB, coordA), norm([coordA.x-coordB.x, coordA.y-coordB.y]))

@test isapprox(get_value(coordA), norm([coordA.x, coordA.y, coordA.z])) 
@test isapprox(get_value(coordB), norm([coordB.x, coordB.y, coordB.z])) 

@test isa(convert(Coord, coordA), Coord)
@test isa(convert(CoordIm, coordA), CoordIm)
@test isa(convert(Coord, coordB), Coord)
@test isa(convert(CoordIm, coordB), CoordIm)

@test convert(Coord, coordA) == coordA
@test convert(Coord, coordB) == coordB
@test convert(CoordIm, coordA) == coordA
@test convert(CoordIm, coordB) == coordB

@test coordA * 2.0 == Coord(2.0, 4.0, 6.0, 8.0, 10.0, 12.0)
@test coordB * 2.0 == Coord(3.0, 5.0, 7.0, 9.0, 11.0, 13.0)
println(times!(convert(Coord, copy(coordB)), 2.0))
@test times!(convert(Coord, copy(coordB)), 2.0) == Coord(3.0, 5.0, 7.0, 9.0, 11.0, 13.0)
@test times!(Coord(), copy(coordA), 2.0) == Coord(2.0, 4.0, 6.0, 8.0, 10.0, 12.0)
@test times!(Coord(), copy(coordB), 2.0) == Coord(3.0, 5.0, 7.0, 9.0, 11.0, 13.0)

@test coordA * 2.0 == Coord(2.0, 4.0, 6.0, 8.0, 10.0, 12.0)
@test coordB * 2.0 == Coord(3.0, 5.0, 7.0, 9.0, 11.0, 13.0)
@test times!(copy(coordA), 2.0) == Coord(2.0, 4.0, 6.0, 8.0, 10.0, 12.0)
@test times!(convert(Coord, copy(coordB)), 2.0) == Coord(3.0, 5.0, 7.0, 9.0, 11.0, 13.0)
@test times!(Coord(), copy(coordA), 2.0) == Coord(2.0, 4.0, 6.0, 8.0, 10.0, 12.0)
@test times!(Coord(), copy(coordB), 2.0) == Coord(3.0, 5.0, 7.0, 9.0, 11.0, 13.0)

@test coordA + coordB == Coord(2.5, 4.5, 6.5, 8.5, 10.5, 12.5)
@test plus!(copy(coordA), coordB) == Coord(2.5, 4.5, 6.5, 8.5, 10.5, 12.5)
@test plus!(Coord(), coordA, coordB) == Coord(2.5, 4.5, 6.5, 8.5, 10.5, 12.5)
@test coordB - coordA == Coord(0.5, 0.5, 0.5, 0.5, 0.5, 0.5)
@test minus!(convert(Coord, copy(coordB)), coordA) == Coord(0.5, 0.5, 0.5, 0.5, 0.5, 0.5)
@test minus!(Coord(), coordB, coordA) == Coord(0.5, 0.5, 0.5, 0.5, 0.5, 0.5)
@test minus!(convert(Coord, copy(coordB)), convert(CoordIm, coordA)) == Coord(0.5, 0.5, 0.5, 0.5, 0.5, 0.5)
@test minus!(Coord(), coordB,  convert(CoordIm, coordA)) == Coord(0.5, 0.5, 0.5, 0.5, 0.5, 0.5)

@test init!(copy(coordA)) == Coord(0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
