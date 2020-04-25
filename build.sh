#!/bin/bash

PREFIX="${PREFIX:-./mongo_build}"
cd rocksdb
USE_RTTI=1 CFLAGS=-fPIC make shared_lib -j8; INSTALL_PATH="$PREFIX" make install;
cd ..
scons mongod -j8 --disable-warnings-as-errors

