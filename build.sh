#!/bin/sh
set -e

root_dir=$(realpath `dirname $0`)
build_dir=/usr/ports/pobj/_renato/prusaslicer

ulimit -d 8388608

mkdir -p "$build_dir"
cd "$build_dir"

export CCACHE_DIR="/usr/ports/pobj/_renato/ccache"
export CMAKE_CXX_COMPILER_LAUNCHER=ccache
export CMAKE_C_COMPILER_LAUNCHER=ccache

ln -fsh "$build_dir/compile_commands.json" "$root_dir/compile_commands.json"

nice cmake "$root_dir" \
     -DSLIC3R_GTK=3 \
     -DSLIC3R_PCH=OFF \
     -DCMAKE_MODULE_PATH=/usr/local/lib/cmake/OpenVDB \
     -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
     -DCMAKE_BUILD_TYPE=Debug

nice make -j4
