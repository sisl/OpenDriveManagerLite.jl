void * createCoord()
{
    OpenDrive::Coord * coord = new OpenDrive::Coord();
    void * retval = coord;
    return retval;
}
void freeCoord(void * void_coord)
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    delete coord;
}

double getDist(void * void_coord,  void * void_coord1,  void * void_coord2 )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    OpenDrive::Coord * coord1 = reinterpret_cast<OpenDrive::Coord*>(void_coord1);
    OpenDrive::Coord * coord2 = reinterpret_cast<OpenDrive::Coord*>(void_coord2);
    return coord->getDist(coord1, coord2);
}
double getDist2d(void * void_odr_manager,  void * void_coord1,  void * void_coord2 ) 
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    OpenDrive::Coord * coord1 = reinterpret_cast<OpenDrive::Coord*>(void_coord1);
    OpenDrive::Coord * coord2 = reinterpret_cast<OpenDrive::Coord*>(void_coord2);
    return coord->getDist(coord1, coord2);
}
void coord_equal(void * void_coordA, void * void_coordB)
{
    OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
    OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
    (*coordA) = (*coordB);
}
//void coord_multiply(void * void_coordA, double void_coordB)
void coord_multiply(void * void_coordA, double coordB)
{
    OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
    //OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
    (*coordA) * (coordB);
}
void coord_plus(void * void_coordA, void * void_coordB)
{
    OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
    OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
    (*coordA) + (*coordB);
}
void coord_subtract(void * void_coordA, void * void_coordB)
{
    OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
    OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
    (*coordA) - (*coordB);
}
void coord_plusequal(void * void_coordA, void * void_coordB)
{
    OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
    OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
    (*coordA) += (*coordB);
}
void coord_minusequal(void * void_coordA, void * void_coordB)
{
    OpenDrive::Coord * coordA = reinterpret_cast<OpenDrive::Coord*>(void_coordA);
    OpenDrive::Coord * coordB = reinterpret_cast<OpenDrive::Coord*>(void_coordB);
    (*coordA)-=(*coordB);
}
double coord_getX(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getX(value);
}
double coord_getY(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getY(value);
}
double coord_getZ(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getZ(value);
}
double coord_getH(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getH(value);
}
double coord_getP(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getP(value);
}
double coord_getR(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getR(value);
}
void coord_set(void * void_coord, double x, double y, double z, double h,  double p, double r)
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->set(x, y, z, h, p, r);
}
void coord_setX(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->setX(value);
}
void coord_setY(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->setY(value);
}
void coord_setZ(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->setZ(value);
}
void coord_setH(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->setH(value);
}
void coord_setP(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->setP(value);
}
void coord_setR(void * void_coord, double value )
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->setR(value);
}
void coord_init(void * void_coord)
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->init();
}
void coord_print(void * void_coord) 
{     
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    coord->print();
}
double coord_getValue(void * void_coord)
{
    OpenDrive::Coord * coord = reinterpret_cast<OpenDrive::Coord*>(void_coord);
    return coord->getValue();
}


