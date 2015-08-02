void * createOdrManagerLite()
{
    OpenDrive::OdrManagerLite * mgr = new OpenDrive::OdrManagerLite();
    void * retval = mgr;
    return retval;
}
void free_OdrManagerLite(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    delete mgr;
}
// bool odr_manager_loadFile(void * void_odr_manager, char * odr_name)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::OdrManagerLite * name = reinterpret_cast<OpenDrive::OdrManagerLite*>(odr_name);
//     return mgr->loadFile(name);
// }

// void odr_manager_printData(void * void_odr_manager) 
// {     
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     mgr->printData();
// }
// void odr_manager_createPosition(void * void_odr_manager)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     mgr->createPosition();
// }
// //TODO(Deon) fix Position * pos
// void odr_manager_activatePosition(void * void_odr_manager, void * void_pos)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::OdrManagerLite * pos = reinterpret_cast<OpenDrive::Position*>(void_pos);
//     mgr->activatePosition(pos);
// }
// float odr_manager_getTrackPos(void * void_odr_manager)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     mgr->getTrackPos();
//     void * retval = &coord;
//     return retval;
// }
// float odr_manager_getLanePos(void * void_odr_manager)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//      OpenDrive::OdrManagerLite coord = mgr->getLanePos();  
//     void * retval = &coord;
//     return retval; 
// }
// float odr_manager_getInertialPos(void * void_odr_manager)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::Coord coord = mgr->getInertialPos();  
//     void * retval = &coord;
//     return retval; 
// }
// float odr_manager_getFootPoint(void * void_odr_manager)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::Coord coord = mgr->getFootPoint();  
//     void * retval = &coord;
//     return retval;
// }
// TODO(Deon) Check trackcoord value
// void odr_manager_setpos_track_coord(void * void_odr_manager, void * void_track_coord)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::OdrManagerLite * value = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_track_coord); 
//     mgr->setPos(value);
// }
void odr_manager_set_track_pos_s_t(void * void_odr_manager, int id, double s, double t)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    mgr->setTrackPos(id, s, t);
}
// void odr_manager_set_track_pos_track_coord(void * void_odr_manager, void * void_track_coord)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::OdrManagerLite * value = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_track_coord);
//     mgr->setTrackPos(value);
// }
// void odr_manager_setpos_lane_coord(void * void_odr_manager, void * void_lane_coord)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::OdrManagerLite * value = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_lane_coord);
//     mgr->setPos(value);
// }

void odr_manager_setLanePos(void * void_odr_manager, int trackId, int laneId, double s, double offset)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    mgr->setLanePos(trackId, laneId, s, offset);
}
// void odr_manager_setLanePos_with_lanecoord(void * void_odr_manager, void * void_lane_coord)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::OdrManagerLite * value = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_lane_coord);
//     mgr->setLanePos(value);
// }
// void odr_manager_setpos_coord(void * void_odr_manager, void * void_coord)
// {
//     OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
//     OpenDrive::OdrManagerLite * value = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_coord);
//     mgr->setPos(value);
// }
void odr_manager_setInertialPos(void * void_odr_manager, double x, double y, double z)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    mgr->setInertialPos(x, y, z);
}
bool odr_manager_track2inertial(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    return mgr->track2inertial();
}
bool odr_manager_inertial2track(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    return mgr->inertial2track();
}
bool odr_manager_lane2inertial(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    return mgr->lane2inertial();
}
bool odr_manager_inertial2lane(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    return mgr->inertial2lane();
}
void odr_manager_print(void * void_odr_manager, int ident)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    mgr->print(ident);
}
double odr_manager_getCurvature(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
     return mgr->getCurvature(); 
}
double odr_manager_getTrackLen(void * void_odr_manager, int trackId)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
     return mgr->getTrackLen(trackId); 
}
double odr_manager_getLaneWidth(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    return mgr->getLaneWidth();  
}
void odr_manager_footPoint2inertial(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    mgr->footPoint2inertial();  
}

