
// double trackcoord_getT(void * void_coord)
// {
//     OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getT();
// }

 // void operator+= ( const TrackCoord & rhs );

 void trackcoord_plusequal(void * void_coordA, void * void_coordB)
 {
    OpenDrive::TrackCoord * coordA = reinterpret_cast<OpenDrive::TrackCoord*>(void_coordA);
    OpenDrive::TrackCoord * coordB = reinterpret_cast<OpenDrive::TrackCoord*>(void_coordB);
    // coordA->operator+=(); 
    (*coordA) += (*coordB);
 }
