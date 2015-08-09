coord = LaneCoord(0, 1.0, 2.0, 3.0)   # distance perpendicular to the track
@test coord.trackid == 0
@test coord.s == 1.0
@test coord.t == 2.0
@test coord.z == 3.0
@test coord.h == 0.0
@test coord.p == 0.0
@test coord.r == 0.0
@test coord.laneid == 1
@test coord.offset == 0.0

@test coord == LaneCoord(0, 1.0, 2.0, 3.0, 0.0, 0.0, 0.0, 1, 0.0)

coord = LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)   # distance perpendicular to the track
@test coord == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)

coordim = LaneCoordIm(0, 1.0, 2.0, 3.0)
@test coordim.trackid == 0
@test coordim.s == 1.0
@test coordim.t == 2.0
@test coordim.z == 3.0
@test coordim.h == 0.0
@test coordim.p == 0.0
@test coordim.r == 0.0
@test coordim.laneid == 1
@test coordim.offset == 0.0

@test coordim == LaneCoord(0, 1.0, 2.0, 3.0, 0.0, 0.0, 0.0, 1, 0.0)
@test coordim == LaneCoordIm(0, 1.0, 2.0, 3.0, 0.0, 0.0, 0.0, 1, 0.0)

coordim = LaneCoordIm(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test coord == coordim
@test coordim == coord

show(coord); print("\n")
show(coordim); print("\n")
print(coord, "\n")
print(coordim, "\n")

@test copy(coord) == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test deepcopy(coord) == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test copy!(LaneCoord(), coord) == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test init!(copy(coord)) == LaneCoord(0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.0)

@test plus!(copy(coord), LaneCoord(1, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 2, 6.5)) == 
        LaneCoord(1, 1.5, 3.5, 5.5, 7.5, 5.0, 6.0, 3, 7.5)
@test plus!(copy(coord), TrackCoord(1, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5)) == 
        LaneCoord(1, 1.5, 3.5, 5.5, 7.5, 5.0, 6.0, 1, 1.0)

@test copy(coordim) == LaneCoordIm(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test deepcopy(coord) == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)


