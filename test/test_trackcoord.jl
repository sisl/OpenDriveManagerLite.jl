coord = TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
@test coord.trackid == 0
@test coord.s == 1.0
@test coord.t == 2.0
@test coord.z == 3.0
@test coord.h == 4.0
@test coord.p == 5.0
@test coord.r == 6.0

@test coord == TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)

coordIM = TrackCoordIm(0, 1.0, 2.0)
@test coordIM.trackid == 0
@test coordIM.s == 1.0
@test coordIM.t == 2.0
@test coordIM.z == 3.0
@test coordIM.h == 0.0
@test coordIM.p == 0.0
@test coordIM.r == 0.0

coordIM = TrackCoordIm(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
@test coordIM.s == 1.0
@test coordIM.t == 2.0
@test coordIM.z == 3.0
@test coordIM.h == 4.0
@test coordIM.p == 5.0
@test coordIM.r == 6.0

@test coord == coordIM
@test coordIM == coord
@test coordIM == CoordIm(1.0,2.0,3.0,4.0,5.0,6.0)


show(coord); print("\n")
println(coord)

@test copy(coord) == TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
@test deepcopy(coord) == TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
@test copy!(TrackCoord(), coord) == TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
@test init!(copy(coord)) == TrackCoord(0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

coordA = TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
coordB = TrackCoord(1, 0.5 ,1.5 ,2.5 ,3.5 ,4.5 ,5.5)
@test plus!(coordA, coordB) == TrackCoord(0, 1.5 ,3.5 ,5.5 ,7.5 ,9.5 ,11.5)

coordIM = TrackCoordIm()
coordIM = TrackCoordIm(0, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)

@test isa(convert(TrackCoordIm, coordA), TrackCoordIm)
@test isa(convert(TrackCoord, coordA), TrackCoord)
@test isa(convert(TrackCoordIm, coordIM), TrackCoordIm)
@test isa(convert(TrackCoord, coordIM), TrackCoord)

@test convert(TrackCoord, coordA) == coordA
@test convert(TrackCoord, coordIM) == coordIM
@test convert(TrackCoordIm, coordA) == coordA
@test convert(TrackCoordIm, coordIM) == coordIM
