#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  _TESTS=true
  _ESTIMATION=true
  _NPROC=4
  _SKIP_JSON_TESTS=false
   # Reason: The job exceeded the maximum time limit for jobs, and has been terminated.
   # This will either have to be resolved by changing build config or paying for
   # a better package for ++ build times.
   # https://travis-ci.com/github/tudat-team/tudat-feedstock
else
  _TESTS=true
  _ESTIMATION=true
  _NPROC=2
  _SKIP_JSON_TESTS=true
fi

mkdir build

cd build

cmake \
  -DCMAKE_CXX_STANDARD=14 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DPREFIX=$PREFIX \
  -DTUDAT_BUILD_TESTS=$_TESTS \
  -DTUDAT_BUILD_WITH_ESTIMATION_TOOLS=$_ESTIMATION \
  -DTUDAT_BUILD_STATIC_LIBRARY=on \
  -DTUDAT_BUILD_TUDAT_TUTORIALS=off \
  -DTUDAT_BUILD_WITH_SOFA_INTERFACE=on \
  -DTUDAT_BUILD_WITH_SPICE_INTERFACE=on \
  -DTUDAT_BUILD_WITH_JSON_INTERFACE=on \
  -DTUDAT_SKIP_JSON_TESTS=$_SKIP_JSON_TESTS \
  ..

make -j$_NPROC

ctest --verbose

make install
