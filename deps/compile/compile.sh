# RUN THIS TO COMPILE THE LIBRARY "bash -x ./compile.sh"

# compile wrapper
g++ -Wall -fPIC -c odr_manager_wrapper.cpp -Llib/Linux/lib64 -lODriveLite.1.4.3
# create shared library
gcc -shared -o libodrmanjl.so -Wl,--whole-archive libODriveLite.1.4.3.a -Wl,--no-whole-archive -Wl,-soname,libodrmanjl.so.1 -o libodrmanjl.so.1.0  odr_manager_wrapper.o
# delete any existing shared library
# rm ../../deps/downloads/libsmilejl.so
# move shared library over
mv libodrmanjl.so.1.0 ../downloads/libodrmanjl.so