#!/bin/bash
ROCKSDB_PREFIX="${ROCKSDB_PREFIX:-$PWD/rocksdb_mod}"

function make_rocksdb_mod {
    pip install --user cheetah typing pyyaml
    USE_RTTI=1 CFLAGS=-fPIC make -C rocksdb shared_lib -j8
    INSTALL_PATH="$ROCKSDB_PREFIX" make -C rocksdb install
}

function make_mongod {
    scons RPATH="$ROCKSDB_PREFIX/lib" CPPPATH="$ROCKSDB_PREFIX/include" LIBPATH="$ROCKSDB_PREFIX/lib" mongod -j8 --disable-warnings-as-errors
}

#make_rocksdb_mod
make_mongod
