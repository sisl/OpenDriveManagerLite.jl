
void lanecoord_plusequal_lanecoord(void * void_coordA, void * void_coordB)
{
    OpenDrive::LaneCoord * coordA = reinterpret_cast<OpenDrive::LaneCoord*>(void_coordA);
    OpenDrive::LaneCoord * coordB = reinterpret_cast<OpenDrive::LaneCoord*>(void_coordB);
    (*coordA) += (*coordB);
}
void lanecoord_plusequal_trackcoord(void * void_coordA, void * void_coordB)
{
    OpenDrive::LaneCoord * coordA = reinterpret_cast<OpenDrive::LaneCoord*>(void_coordA);
    OpenDrive::TrackCoord * coordB = reinterpret_cast<OpenDrive::TrackCoord*>(void_coordB);
    (*coordA) += (*coordB);
}
// void lane_coord_print(void * void_coord)
// {
// 	OpenDrive::LaneCoord * coord = reinterpret_cast<OpenDrive::LaneCoord*>(void_coord);
// 	coord->print();
// }


