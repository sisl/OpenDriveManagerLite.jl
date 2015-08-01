#ifndef _ODR_MAN_WRAPPER_H_
#define _ODR_MAN_WRAPPER_H_

///////////////////////////////////////
//              UTILITY              //
///////////////////////////////////////

extern "C" bool libexists() { return true; }

///////////////////////////////////////
//           ODR TRACK COORD         //
///////////////////////////////////////

// extern "C" double trackcoord_getT(void * void_coord);
extern "C" void trackcoord_plusequal(void * void_coordA, void * void_coordB);

/////////////////////////////////////
         ODR MANAGER LITE         //
/////////////////////////////////////

extern "C" void * createOdrManagerLite();
extern "C" void freeOdrManagerLite(void * void_odr_manager);
extern "C" bool odr_manager_loadFile(void * void_odr_manager, char name);
extern "C" void odr_manager_printData(void * void_odr_manager);
extern "C" void odr_manager_createPosition(void * void_odr_manager);
extern "C" void odr_manager_activatePosition(void * void_odr_manager, void * void_pos);
extern "C" void odr_manager_getTrackPos(void * void_odr_manager);
extern "C" float odr_manager_getLanePos(void * void_odr_manager);
extern "C" float odr_manager_getInertialPos(void * void_odr_manager);
extern "C" float odr_manager_getFootPoint(void * void_odr_manager);
extern "C" void odr_manager_setpos_track_coord(void * void_odr_manager, void * void_track_coord);
extern "C" void odr_manager_set_track_pos_s_t(void * void_odr_manager, int id, double s, double t);
extern "C" void odr_manager_set_track_pos_track_coord(void * void_odr_manager, void * void_track_coord);
extern "C" void odr_manager_setpos_lane_coord(void * void_odr_manager, void * void_lane_coord);
extern "C" void odr_manager_setLanePos(void * void_odr_manager, int trackId, int laneId, double s, double offset);
extern "C" void odr_manager_setLanePos_with_lanecoord(void * void_odr_manager, void * void_lane_coord);
extern "C" void odr_manager_setpos_coord(void * void_odr_manager, void * void_coord);
extern "C" void odr_manager_setInertialPos(void * void_odr_manager, double x, double y, double z);
extern "C" bool odr_manager_track2inertial(void * void_odr_manager);
extern "C" bool odr_manager_inertial2track(void * void_odr_manager);
extern "C" bool odr_manager_lane2inertial(void * void_odr_manager);
extern "C" bool odr_manager_inertial2lane(void * void_odr_manager);
extern "C" void odr_manager_print(void * void_odr_manager, int ident);
extern "C" double odr_manager_getCurvature(void * void_odr_manager);
extern "C" double odr_manager_getTrackLen(void * void_odr_manager, int trackId);
extern "C" double odr_manager_getLaneWidth(void * void_odr_manager);
extern "C" void odr_manager_footPoint2inertial(void * void_odr_manager);

///////////////////////////////////////
//          TRACK COORD              //
///////////////////////////////////////

// extern "C" void * createTrackCoord();
// extern "C" void freeTrackCoord(void * void_coord);
// extern "C" void trackcoord_plusequal(void * void_coordA, void * void_coordB);
// extern "C" int trackcoord_get_trackid(void * void_coord);
// extern "C" double trackcoord_getS(void * void_coord);
// extern "C" double trackcoord_getT(void * void_coord);
// extern "C" double trackcoord_getZ(void * void_coord);
// extern "C" double trackcoord_getH(void * void_coord);
// extern "C" double trackcoord_getP(void * void_coord);
// extern "C" double trackcoord_getR(void * void_coord);
// extern "C" void trackcoord_set_trackid(void * void_coord, int value);
// extern "C" void trackcoord_setS(void * void_coord, double value);
// extern "C" void trackcoord_setT(void * void_coord, double value);
// extern "C" void trackcoord_setZ(void * void_coord, double value);
// extern "C" void trackcoord_setH(void * void_coord, double value);
// extern "C" void trackcoord_setP(void * void_coord, double value);
// extern "C" void trackcoord_setR(void * void_coord, double value);
// extern "C" void trackcoord_init();
// extern "C" void trackcoord_print();

/////////////////////////////////////
//         LANE COORD              //
/////////////////////////////////////

extern "C" void * createOdrManagerLite();
extern "C" void freeOdrManagerLite(void * void_coord);
extern "C" void track_coord_plusequal(void * void_coordA, void * void_coordB);
extern "C" void lane_coord_plusequal(void * void_coordA, void * void_coordB);
extern "C" int lane_coord_get_laneid(void * void_coord);
extern "C" double lane_coord_get_offset(void * void_coord);
extern "C" void lane_coord_set_laneid(void * void_coord, int value);
extern "C" void lane_coord_set_offset(void * void_coord,  double value);
extern "C" void lane_coord_initialize(void * void_coord);
extern "C" void lane_coord_print(void * void_coord);







#endif
