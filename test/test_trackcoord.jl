coord = TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
@test coord.trackid == 0
@test coord.s == 1.0
@test coord.t == 2.0
@test coord.z == 3.0
@test coord.h == 4.0
@test coord.p == 5.0
@test coord.r == 6.0

show(coord)
print("\n")
print(coord) 

coordA = copy(coord)
@test coordA.trackid == 0
@test coordA.s == 1.0
@test coordA.t == 2.0
@test coordA.z == 3.0
@test coordA.h == 4.0
@test coordA.p == 5.0
@test coordA.r == 6.0

coordB = deepcopy(coord)
@test coordB.trackid == 0
@test coordB.s == 1.0
@test coordB.t == 2.0
@test coordB.z == 3.0
@test coordB.h == 4.0
@test coordB.p == 5.0
@test coordB.r == 6.0

coordC = TrackCoord()
copy!(coordC, coord)
@test coordC.trackid == 0
@test coordC.s == 1.0
@test coordC.t == 2.0
@test coordC.z == 3.0
@test coordC.h == 4.0
@test coordC.p == 5.0
@test coordC.r == 6.0

coordB.s = 5.5
coordC = plus!(copy(coordA), coordB)

@test coordC.trackid == coordB.trackid == coordA.trackid
@test coordC.s == coordA.s + coordB.s
@test coordC.t == coordA.t + coordB.t
@test coordC.z == coordA.z + coordB.z
@test coordC.h == coordA.h + coordB.h
@test coordC.p == coordA.p + coordB.p
@test coordC.r == coordA.r + coordB.r

coord = TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
initialize!(coord)
@test coord.trackid == 0
@test coord.s == 0.0
@test coord.t == 0.0
@test coord.z == 0.0
@test coord.h == 0.0
@test coord.p == 0.0
@test coord.r == 0.0

# print_trackcoord(coordC)



