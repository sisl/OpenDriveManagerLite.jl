void trackcoord_plusequal(void * void_trackcoordA, void * void_trackcoordB)
{
    OpenDrive::TrackCoord * coordA = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoordA);
    OpenDrive::TrackCoord * coordB = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoordB);
    (*coordA) += (*coordB);
}
// void trackcoord_print(void * void_trackcoord) 
// {
// 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
//     coord->print(); 	
// } 