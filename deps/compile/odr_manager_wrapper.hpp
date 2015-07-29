#ifndef _ODR_MAN_WRAPPER_H_
#define _ODR_MAN_WRAPPER_H_

///////////////////////////////////////
//              UTILITY              //
///////////////////////////////////////

extern "C" bool libexists() { return true; }

///////////////////////////////////////
//           ODR TRACK COORD         //
///////////////////////////////////////

// extern "C" double trackcoord_getT(void * void_coord);
extern "C" void trackcoord_plusequal(void * void_coordA, void * void_coordB);

///////////////////////////////////////
//          ODR MANAGER LITE         //
///////////////////////////////////////

extern "C" void * createOdrManagerLite();
extern "C" void freeOdrManagerLite(void * void_odr_manager);
extern "C" bool odr_manager_loadFile(void * void_odr_manager, char * name);
extern "C" void odr_manager_printData(void * void_odr_manager);
extern "C" void * odr_manager_getTrackPos(void * void_odr_manager);

#endif
