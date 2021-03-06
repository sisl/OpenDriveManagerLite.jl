double coord_getDist(void * void_coord1,  void * void_coord2 )
{
    OpenDrive::Coord * coord1 = reinterpret_cast<OpenDrive::Coord*>(void_coord1);
    OpenDrive::Coord * coord2 = reinterpret_cast<OpenDrive::Coord*>(void_coord2);
    return OpenDrive::Coord::getDist(*coord1, *coord2);
}
double coord_getDist2d(void * void_coord1,  void * void_coord2 ) 
{
    OpenDrive::Coord * coord1 = reinterpret_cast<OpenDrive::Coord*>(void_coord1);
    OpenDrive::Coord * coord2 = reinterpret_cast<OpenDrive::Coord*>(void_coord2);
    return OpenDrive::Coord::getDist2d(*coord1, *coord2);
}
// void * coord_multiply(void * void_coordA, double coordB)
// {
//     OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
//     OpenDrive::Coord coordC = (*coordA) * coordB;
//     void * retval = &coordC;
//     return retval;
// }
// void * coord_plus(void * void_coordA, void * void_coordB)
// {
//     OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
//     OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
//     OpenDrive::Coord * coordC = new OpenDrive::Coord();
//     (*coordC) = (*coordA) + (*coordB);

//     printf("%f\n", coordC->getX());
//     printf("%f\n", coordC->getY());
//     printf("%f\n", coordC->getZ());
//     printf("%f\n", coordC->getH());
//     printf("%f\n", coordC->getP());
//     printf("%f\n", coordC->getR());

//     void * retval = coordC;
//     return retval;
// }
// void * coord_subtract(void * void_coordA, void * void_coordB)
// {
//     OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
//     OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
//     OpenDrive::Coord * coordC = new OpenDrive::Coord();

//     (*coordC) = (*coordA) - (*coordB);

//     // printf("%f\n", coordC->getX());
//     // printf("%f\n", coordC->getY());
//     // printf("%f\n", coordC->getZ());
//     // printf("%f\n", coordC->getH());
//     // printf("%f\n", coordC->getP());
//     // printf("%f\n", coordC->getR());

//     void * retval = coordC;
//     return retval;
// }

// void coord_plusequal(void * void_coordA, void * void_coordB)
// {
//     OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
//     OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
//     (*coordA) += (*coordB);
// }
// void coord_minusequal(void * void_coordA, void * void_coordB)
// {
//     OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
//     OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
//     (*coordA)-=(*coordB);
// }
// void coord_print(void * void_coord) 
// {     
//     OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
//     coord->print();
// }
double coord_getValue(void * void_coord)
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getValue();
}


