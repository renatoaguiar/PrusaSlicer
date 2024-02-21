#!/bin/sh
set -e

ulimit -d 8388608

cd `dirname $0`
mkdir -p build
cd build
touch .nobackup

export CMAKE_CXX_COMPILER_LAUNCHER=ccache
export CMAKE_C_COMPILER_LAUNCHER=ccache

nice cmake .. \
     -DSLIC3R_GTK=3 \
     -DSLIC3R_PCH=OFF \
     -DCMAKE_MODULE_PATH=/usr/local/lib/cmake/OpenVDB \
     -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
     -DCMAKE_BUILD_TYPE=Debug

nice make -j4
