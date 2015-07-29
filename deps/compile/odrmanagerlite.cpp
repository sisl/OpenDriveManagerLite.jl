void * createOdrManagerLite()
{
    OpenDrive::OdrManagerLite * mgr = new OpenDrive::OdrManagerLite();
    void * retval = mgr;
    return retval;
}

void freeOdrManagerLite(void * void_odr_manager)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    delete mgr;
}

bool odr_manager_loadFile(void * void_odr_manager, char * name)
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    return mgr->loadFile(name);
}

void odr_manager_printData(void * void_odr_manager) 
{
    OpenDrive::OdrManagerLite * mgr = reinterpret_cast<OpenDrive::OdrManagerLite*>(void_odr_manager);
    mgr->printData();
}