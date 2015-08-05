coord = LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)   # distance perpendicular to the track
@test coord.trackid == 0
@test coord.s == 1.0
@test coord.t == 2.0
@test coord.z == 3.0
@test coord.h == 4.0
@test coord.p == 5.0
@test coord.r == 6.0
@test coord.laneid == 1
@test coord.offset == 1.0

@test coord == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)

@test copy(coord) == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test deepcopy(coord) == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test copy!(LaneCoord(), coord) == LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0)
@test init!(copy(coord)) == LaneCoord(0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.0)

@test plus!(copy(coord), LaneCoord(1, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 2, 6.5)) == 
        LaneCoord(1, 1.5, 3.5, 5.5, 7.5, 5.0, 6.0, 3, 7.5)

@test plus!(copy(coord), TrackCoord(1, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5)) == 
        LaneCoord(1, 1.5, 3.5, 5.5, 7.5, 5.0, 6.0, 1, 1.0)


