
// double trackcoord_getT(void * void_coord)
// {
//     OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getT();
// }

//TODO(Deon) do i need this?
// void * createTrackCoord()
// {
//     OpenDrive::TrackCoord * coord = new OpenDrive::TrackCoord();
//     void * retval = coord;
//     return retval;
// }
// //
// void freeTrackCoord(void * void_coord)
// {
//     OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     delete coord;
// }
// //void operator= just adds the two corresponding points so we removed it
//  // void operator+= ( const TrackCoord & rhs );
// void trackcoord_plusequal(void * void_coordA, void * void_coordB)
// {
//     OpenDrive::TrackCoord * coordA = reinterpret_cast<OpenDrive::TrackCoord*>(void_coordA);
//     OpenDrive::TrackCoord * coordB = reinterpret_cast<OpenDrive::TrackCoord*>(void_coordB);
//     // coordA->operator+=(); 
//         (*coordA) += (*coordB);
// }
// //int & getTrackId() const;
//  //do i need to do something for & like *
// int trackcoord_get_trackid(void * void_coord)
// {
// 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
// 	return coord->getTrackId();
// }
// double trackcoord_getS(void * void_coord)
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getS();
// }
// double trackcoord_getT(void * void_coord) 
// {
// 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getT();
// }
// double trackcoord_getZ(void * void_coord)
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getZ();	
// }
// double trackcoord_getH(void * void_coord)
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getH();
// }
// double trackcoord_getP(void * void_coord)
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getP();
// }
// double trackcoord_getR(void * void_coord)
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     return coord->getR();
// }
// void trackcoord_set_trackid(void * void_coord, int * value )
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->setTrackId(value);
// }
// void trackcoord_setS(void * void_coord, double * value )
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->setS(value);
// }
// void trackcoord_setT(void * void_coord, double * value )
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->setT(value);
// }
// void trackcoord_setZ(void * void_coord, double * value )
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->setZ(value);
// }
// void trackcoord_setH(void * void_coord, double * value )
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->setH(value);
// }
// void trackcoord_setP(void * void_coord, double * value )
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->setP(value);
// }
// void trackcoord_setR(void * void_coord, double * value )
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->setR(value);
// }
// void trackcoord_init()
// {
//  	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->init();
// }
// void trackcoord_print() 
// {
// 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_coord);
//     coord->print(); 	
// } 