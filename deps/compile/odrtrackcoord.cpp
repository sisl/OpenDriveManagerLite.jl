void trackcoord_plusequal(void * void_trackcoordA, void * void_trackcoordB)
{
    OpenDrive::TrackCoord * coordA = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoordA);
    OpenDrive::TrackCoord * coordB = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoordB);
    // coordA->operator+=(); 
    (*coordA) += (*coordB);
}
//int & getTrackId() const;
 //do i need to do something for & like *
int trackcoord_get_trackid(void * void_trackcoord)
{
	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
	return coord->getTrackId();
}
double trackcoord_getS(void * void_trackcoord)
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    return coord->getS();
}
double trackcoord_getT(void * void_trackcoord) 
{
	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    return coord->getT();
}
double trackcoord_getZ(void * void_trackcoord)
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    return coord->getZ();	
}
double trackcoord_getH(void * void_trackcoord)
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    return coord->getH();
}
double trackcoord_getP(void * void_trackcoord)
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    return coord->getP();
}
double trackcoord_getR(void * void_trackcoord)
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    return coord->getR();
}
void trackcoord_set_trackid(void * void_trackcoord, int value )
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->setTrackId(value);
}
void trackcoord_setS(void * void_trackcoord, double value )
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->setS(value);
}
void trackcoord_setT(void * void_trackcoord, double value )
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->setT(value);
}
void trackcoord_setZ(void * void_trackcoord, double value )
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->setZ(value);
}
void trackcoord_setH(void * void_trackcoord, double value )
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->setH(value);
}
void trackcoord_setP(void * void_trackcoord, double value )
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->setP(value);
}
void trackcoord_setR(void * void_trackcoord, double value )
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->setR(value);
}
void trackcoord_init(void * void_trackcoord)
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->init();
}
void trackcoord_print(void * void_trackcoord) 
{
	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->print(); 	
} 