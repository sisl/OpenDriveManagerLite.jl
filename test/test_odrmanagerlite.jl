 
mgr = OdrManagerLite()
@test mgr.has_activated_position == false

a = 0x00
pos = Position(pointer_from_objref(a))
pos = 2 # delete ptr

# these should trigger warnings
@test isa(get_trackpos(mgr), Nothing)
@test isa(get_lanepos(mgr), Nothing)
@test isa(get_inertialpos(mgr), Nothing)
@test isa(get_footpoint(mgr), Nothing)


XODR_FILE = joinpath(Pkg.dir("OpenDriveManagerLite", "test"), "1lane.xodr")
@test loadfile(mgr, XODR_FILE)
printdata(mgr)

pos = create_position(mgr)
@test pos.ptr != C_NULL
@test mgr.has_activated_position == true

activate_position(mgr, pos)
@test mgr.has_activated_position == true
 
@test get_trackpos(mgr) == init!(TrackCoord())

lanepos = get_lanepos(mgr)
@test lanepos.trackid == 0
@test isapprox(lanepos.s, 0.0)
@test isapprox(lanepos.t, 0.0)
@test isapprox(lanepos.z, 0.0)
@test isapprox(lanepos.h, 0.0)
@test lanepos.laneid == 0
@test isapprox(lanepos.offset, 0.0)

@test get_inertialpos(mgr) == init!(Coord())
# @test get_footpoint(mgr) == init!(Coord())

function check_pos(mgr, trackid, s, t, z_track, h_track, x, y, z_inertial, h_inertial)
    trackpos = get_trackpos(mgr)
    @test trackpos.trackid == trackid
    @test isapprox(trackpos.s, s, atol=1e-3)
    @test isapprox(trackpos.t, t, atol=1e-3)
    @test isapprox(trackpos.z, z_track, atol=1e-3)
    @test isapprox(trackpos.h, h_track, atol=1e-4)

    lanepos = get_lanepos(mgr)
    @test lanepos.trackid == trackid
    @test isapprox(lanepos.s, s, atol=1e-3)
    @test isapprox(lanepos.t, t, atol=1e-3)
    @test isapprox(lanepos.z, z_track, atol=1e-3)
    @test isapprox(lanepos.h, h_track, atol=1e-4)

    @test track2inertial(mgr)
    ipos = get_inertialpos(mgr)
    @test isapprox(ipos.x, x, atol=1e-3)
    @test isapprox(ipos.y, y, atol=1e-3)
    @test isapprox(ipos.z, z_inertial, atol=1e-3)
    @test isapprox(ipos.h, h_inertial, atol=1e-4)
end
function check_pos(mgr, trackid, s, t, z_track, h_track, laneid, offset,
                                 x, y, z_inertial, h_inertial)
    trackpos = get_trackpos(mgr)
    @test trackpos.trackid == trackid
    @test isapprox(trackpos.s, s, atol=1e-3)
    @test isapprox(trackpos.t, t, atol=1e-3)
    @test isapprox(trackpos.z, z_track, atol=1e-3)
    @test isapprox(trackpos.h, h_track, atol=1e-4)

    lanepos = get_lanepos(mgr)
    @test lanepos.trackid == trackid
    @test isapprox(lanepos.s, s, atol=1e-3)
    @test isapprox(lanepos.t, t, atol=1e-3)
    @test isapprox(lanepos.z, z_track, atol=1e-3)
    @test isapprox(lanepos.h, h_track, atol=1e-4)
    @test lanepos.laneid == laneid
    @test lanepos.offset == offset

    @test lane2inertial(mgr)
    ipos = get_inertialpos(mgr)
    @test isapprox(ipos.x, x, atol=1e-3)
    @test isapprox(ipos.y, y, atol=1e-3)
    @test isapprox(ipos.z, z_inertial, atol=1e-3)
    @test isapprox(ipos.h, h_inertial, atol=1e-4)
end
function check_lanepos(mgr, trackid, laneid, s, offset,
                            x, y, z_inertial, h_inertial)
    trackpos = get_trackpos(mgr)
    @test trackpos.trackid == trackid
    @test isapprox(trackpos.s, s, atol=1e-3)

    lanepos = get_lanepos(mgr)
    @test lanepos.trackid == trackid
    @test isapprox(lanepos.s, s, atol=1e-3)
    @test lanepos.laneid == laneid
    @test lanepos.offset == offset

    @test lane2inertial(mgr)
    ipos = get_inertialpos(mgr)
    @test isapprox(ipos.x, x, atol=1e-3)
    @test isapprox(ipos.y, y, atol=1e-3)
    @test isapprox(ipos.z, z_inertial, atol=1e-3)
    @test isapprox(ipos.h, h_inertial, atol=1e-4)
end

set_pos(mgr, TrackCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0,
                  1.0, 2.0, 9.5, 4.0)

set_pos(mgr, TrackCoord(0, 10.0, 2.0, 3.0, 1.0, 5.0, 6.0))
check_pos(mgr, 0, 10.0, 2.0, 3.0, 1.0,
                  10.0, 2.0, 9.5, 1.0)

set_pos(mgr, TrackCoord(0, 2785.3981634, 500.0, 1.0, 0.0, 5.0, 6.0))
check_pos(mgr, 0, 2785.3981634, 500.0, 1.0, 0.0,
                  2000.0,       500.0, 9.5, pi/2)

set_pos(mgr, LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, -1, 0.0))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0,
                  1.0, 2.0, 9.5, 4.0)

set_pos(mgr, LaneCoord(0, 10.0, 2.0, 3.0, 1.0, 5.0, 6.0, -1, 0.0))
check_pos(mgr, 0, 10.0, 2.0, 3.0, 1.0,
                  10.0, 2.0, 9.5, 1.0)

set_pos(mgr, LaneCoord(0, 2785.3981634, 500.0, 1.0, 0.0, 5.0, 6.0, -1, 0.0))
check_pos(mgr, 0, 2785.3981634, 500.0, 1.0, 0.0,
                  2000.0,       500.0, 9.5, pi/2)

set_trackpos(mgr, 0, 1.0, 2.0)
check_pos(mgr, 0, 1.0, 2.0, 1.0, 0.0,
                  1.0, 2.0, 9.5, 0.0)

set_trackpos(mgr, TrackCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0,
                  1.0, 2.0, 9.5, 4.0)

set_trackpos(mgr, TrackCoord(0, 10.0, 2.0, 3.0, 1.0, 5.0, 6.0))
check_pos(mgr, 0, 10.0, 2.0, 3.0, 1.0,
                  10.0, 2.0, 9.5, 1.0)

set_trackpos(mgr, TrackCoord(0, 2785.3981634, 500.0, 1.0, 0.0, 5.0, 6.0))
check_pos(mgr, 0, 2785.3981634, 500.0, 1.0, 0.0,
                  2000.0,       500.0, 9.5, pi/2)

set_lanepos(mgr, LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, -1, 0.0))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0, -1, 0.0,
                  1.0, -1.625, 9.5, 4.0)

set_lanepos(mgr, LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, -1, 0.5))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0, -1, 0.5,
                  1.0, -1.625+0.5, 9.5, 4.0)

set_lanepos(mgr, 0, -1, 1.0, 0.0)
check_lanepos(mgr, 0, -1, 1.0, 0.0,
                      1.0, -1.625, 9.5, 4.0)

set_lanepos(mgr, 0, -1, 1.0, 0.5)
check_lanepos(mgr, 0, -1, 1.0, 0.5,
                  1.0, -1.625+0.5, 9.5, 4.0)

set_trackpos(mgr, 0, 0.0, 0.0)
@test track2inertial(mgr)
set_pos(mgr, Coord(1.0, 2.0, 3.0, 4.0, 5.0, 6.0))
@test inertial2track(mgr)
@test get_inertialpos(mgr) == Coord(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
pos = get_trackpos(mgr)
@test pos.trackid == 0
@test isapprox(pos.s, 1.0, atol=1e-3)
@test isapprox(pos.t, 2.0, atol=1e-3)

set_inertialpos(mgr, 1000.0, -1.0, 0.0)
@test inertial2track(mgr)

pos = get_inertialpos(mgr)
@test isapprox(pos.x, 1000.0, atol=1e-3)
@test isapprox(pos.y,   -1.0, atol=1e-3)
@test isapprox(pos.z,    0.0, atol=1e-3)

pos = get_trackpos(mgr)
@test pos.trackid == 0
@test isapprox(pos.s, 1000.0, atol=1e-3)
@test isapprox(pos.t,   -1.0, atol=1e-3)

@test inertial2lane(mgr)
pos = get_lanepos(mgr)
@test pos.trackid == 0
@test isapprox(pos.s, 1000.0, atol=1e-3)
@test isapprox(pos.t,   -1.0, atol=1e-3)
@test isapprox(pos.z,    9.5, atol=1e-3)
@test pos.laneid == -1
@test isapprox(pos.offset, 0.625)

set_inertialpos(mgr, 1000.0, -2.0, 0.0)
@test inertial2lane(mgr)
pos = get_lanepos(mgr)
@test pos.trackid == 0
@test isapprox(pos.s, 1000.0, atol=1e-3)
@test isapprox(pos.t,   -2.0, atol=1e-3)
@test isapprox(pos.z,    9.5, atol=1e-3)
@test pos.laneid == -1
@test isapprox(pos.offset, 0.625-1.0)

@test isapprox(get_curvature(mgr), 0.0, atol=1e-5)

set_inertialpos(mgr, 2500.0, 500.0, 0.0)
@test inertial2track(mgr)
@test isapprox(get_curvature(mgr), 1/500.0, atol=1e-5)

@test isapprox(get_track_len(mgr, 0), 2000.0*2 + 2*pi*500.0)
@test isapprox(get_lane_width(mgr), 3.25)

print_odrmanagerlite(mgr)
 

