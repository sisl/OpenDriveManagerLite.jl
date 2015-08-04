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
void lane_coord_initialize(void * void_coord)
{
	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
	coord->init();
}
void lane_coord_print(void * void_coord)
{
	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
	coord->print();
}


