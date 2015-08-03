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