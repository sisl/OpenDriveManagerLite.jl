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

coordA = coord
@test coordA.trackid == 0
@test coordA.s == 1.0
@test coordA.t == 2.0
@test coordA.z == 3.0
@test coordA.h == 4.0
@test coordA.p == 5.0
@test coordA.r == 6.0
@test coord.laneid == 1
@test coord.offset == 1.0

coordB = coord
@test coordB.trackid == 0
@test coordB.s == 1.0
@test coordB.t == 2.0
@test coordB.z == 3.0
@test coordB.h == 4.0
@test coordB.p == 5.0
@test coordB.r == 6.0
@test coord.laneid == 1
@test coord.offset == 1.0

coordB.s = 5.5

lane_coord_plusequal(coordA, coordB)

coordA = TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
@test coordA.trackid == 0
@test coordA.s == 1.0
@test coordA.t == 2.0
@test coordA.z == 3.0
@test coordA.h == 4.0
@test coordA.p == 5.0
@test coordA.r == 6.0

coord = LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 1, 1.0) 
intitialize_lanecoord!(coord)
@test coord.trackid == 0
@test coord.s == 0.0
@test coord.t == 0.0
@test coord.z == 0.0
@test coord.h == 0.0
@test coord.p == 0.0
@test coord.r == 0.0 
@test coord.laneid == 0
@test coord.offset == 0.0 

coordB = coordA
coordB.s = 4.0
track_coord_plusequal(coordA, coordB)

vires_print_lanecoord(coord)