void * createOdrManagerLite()
{
    OpenDrive::LaneCoord * coord = new OpenDrive::LaneCoord();
    void * retval = coord;
    return retval;
}
void freeOdrManagerLite(void * void_coord)
{
    OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
    delete coord;
}
void track_coord_plusequal(void * void_coordA, void * void_coordB)
{
    OpenDrive::TrackCoord * coordA = reinterpret_cast<OpenDrive::TrackCoord*>(void_coordA);
    OpenDrive::TrackCoord * coordB = reinterpret_cast<OpenDrive::TrackCoord*>(void_coordB);
    // coordA->operator+=(); 
    (*coordA) += (*coordB);
}
void lane_coord_plusequal(void * void_coordA, void * void_coordB)
{
    OpenDrive::LaneCoord * coordA = reinterpret_cast<OpenDrive::LaneCoord*>(void_coordA);
    OpenDrive::LaneCoord * coordB = reinterpret_cast<OpenDrive::LaneCoord*>(void_coordB);
    // coordA->operator+=(); 
    (*coordA) += (*coordB);
}
int lane_coord_get_laneid(void * void_coord)
{
	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
	return coord->getLaneId();
}
double lane_coord_get_offset(void * void_coord)
{
	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
	return coord->getOffset();
}
void lane_coord_set_laneid(void * void_coord, int * value)
{
	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
	coord->setLaneId(value);
}
void lane_coord_set_offset(void * void_coord,  double * value)
{
	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
	coord->setOffset(value);
}
void lane_coord_initialize(void * void_coord)
{
	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
	coord->init();
}
void lane_coord_print(void * void_coord)
{
	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
	coord->print();
}


