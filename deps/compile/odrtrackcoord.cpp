void trackcoord_plusequal(void * void_trackcoordA, void * void_trackcoordB)
{
    OpenDrive::TrackCoord * coordA = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoordA);
    OpenDrive::TrackCoord * coordB = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoordB);
    (*coordA) += (*coordB);
}
void trackcoord_init(void * void_trackcoord)
{
 	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    printf("trackId: %d\n", coord->getTrackId());
    printf("s:       %f\n", coord->getS());
    printf("t:       %f\n", coord->getT());
    printf("z:       %f\n", coord->getZ());
    printf("h:       %f\n", coord->getH());
    printf("p:       %f\n", coord->getP());
    printf("r:       %f\n", coord->getR());
    coord->init();
    printf("trackId: %d\n", coord->getTrackId());
    printf("s:       %f\n", coord->getS());
    printf("t:       %f\n", coord->getT());
    printf("z:       %f\n", coord->getZ());
    printf("h:       %f\n", coord->getH());
    printf("p:       %f\n", coord->getP());
    printf("r:       %f\n", coord->getR());
}
void trackcoord_print(void * void_trackcoord) 
{
	OpenDrive::TrackCoord * coord = reinterpret_cast<OpenDrive::TrackCoord*>(void_trackcoord);
    coord->print(); 	
} 