 
mgr = OdrManagerLite()
@test mgr.has_activated_position == false

@test loadfile(mgr, "1lane.xodr")
# printdata(mgr)

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

set_track_pos(mgr, 0, 1.0, 2.0)
check_pos(mgr, 0, 1.0, 2.0, 1.0, 0.0,
                  1.0, 2.0, 9.5, 0.0)

set_track_pos(mgr, TrackCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0,
                  1.0, 2.0, 9.5, 4.0)

set_track_pos(mgr, TrackCoord(0, 10.0, 2.0, 3.0, 1.0, 5.0, 6.0))
check_pos(mgr, 0, 10.0, 2.0, 3.0, 1.0,
                  10.0, 2.0, 9.5, 1.0)

set_track_pos(mgr, TrackCoord(0, 2785.3981634, 500.0, 1.0, 0.0, 5.0, 6.0))
check_pos(mgr, 0, 2785.3981634, 500.0, 1.0, 0.0,
                  2000.0,       500.0, 9.5, pi/2)

set_lane_pos(mgr, LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, -1, 0.0))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0, -1, 0.0,
                  1.0, -1.625, 9.5, 4.0)

set_lane_pos(mgr, LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, -1, 0.5))
check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0, -1, 0.5,
                  1.0, -1.625+0.5, 9.5, 4.0)

set_lane_pos(mgr, 0, -1, 1.0, 0.0)
check_lanepos(mgr, 0, -1, 1.0, 0.0,
                      1.0, -1.625, 9.5, 4.0)

set_lane_pos(mgr, 0, -1, 1.0, 0.5)
check_lanepos(mgr, 0, -1, 1.0, 0.5,
                  1.0, -1.625+0.5, 9.5, 4.0)

println(get_trackpos(mgr))
println(get_inertialpos(mgr))
set_track_pos(mgr, 0, 0.0, 0.0)
@test track2inertial(mgr)
println(get_trackpos(mgr))
println(get_inertialpos(mgr))
set_pos(mgr, Coord(1.0, 2.0, 3.0, 4.0, 5.0, 6.0))
@test inertial2track(mgr)
println(get_trackpos(mgr))
println(get_inertialpos(mgr))


# set_lane_pos(mgr, LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 0, 0.0))
# check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0,
#                   1.0, 2.0, 9.5, 4.0)

# set_lane_pos(mgr, LaneCoord(0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, -1, 0.5))
# check_pos(mgr, 0, 1.0, 2.0, 3.0, 4.0,
#                   1.0, 2.0, 9.5, 4.0)

# fpos = get_footpoint(mgr)
# println(fpos)
# @test isapprox(ipos.s, 1.0)
# @test isapprox(ipos.t, 2.0)
# @test isapprox(ipos.z, 3.0)
# @test isapprox(ipos.h, 4.0)



 
 # value = TrackCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
 # set_pos(mgr, value)
 # set_trackpos_s_t(mgr, 1, 1.0, 2.0)
 # set_trackpos_track_coord(mgr, value)
 
 # value = LaneCoord(0, 1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0, 1, 0.0)
 # set_pos_with_lanecoord(mgr, value)
 # set_lanepos(mgr, 1, 1, 2.0, 3.0)
 # set_lanepos_with_lanecoord(mgr, value)
 
 # value = Coord(1.0 ,2.0 ,3.0 ,4.0 ,5.0 ,6.0)
 # set_pos_with_coord(mgr, value)
 # set_inertialpos(mgr, 1.0, 2.0, 3.0)
 
 # @test convert_track_to_inertial(mgr)
 # @test convert_inertial_to_track(mgr)
 # # @test convert_lane_to_inertial(mgr)
 # @test convert_inertial_to_lane(mgr)
 
 # print_odrmanagerlite(mgr, 0)

 # curvature = get_curvature(mgr)
 # @test isdefined(:curvature)
 # @test get_curvature(mgr)==0.0

 # tracklength = get_track_len(mgr, 1)
 # @test isdefined(:tracklength)
 # # println(length)

 # width = get_lane_width(mgr)
 # @test isdefined(:width)
 # # println(width)

 # copy_foot_point_to_inertial(mgr)
 

