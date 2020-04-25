cd rocksdb
USE_RTTI=1 CFLAGS=-fPIC make shared_lib -j8; sudo INSTALL_PATH=/usr make install;
cd ..
scons mongod -j8 --disable-warnings-as-errors

