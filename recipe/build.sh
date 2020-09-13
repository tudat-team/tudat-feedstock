#!/usr/bin/env bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  ENABLE_TESTS=true
  BUILD_ESTIMATION_TOOLS=true
  NPROC=4
  SKIP_JSON_TESTS=false
  # Reason: The job exceeded the maximum time limit for jobs, and has been terminated.
  # This will either have to be resolved by changing build config or paying for
  # a better package for ++ build times.
  # https://travis-ci.com/github/tudat-team/tudat-feedstock
else
  ENABLE_TESTS=true
  BUILD_ESTIMATION_TOOLS=true
  NPROC=2
  SKIP_JSON_TESTS=true
fi

mkdir build

cd build

cmake \
  -DCMAKE_CXX_STANDARD=14 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DPREFIX=$PREFIX \
  -DTUDAT_BUILD_TESTS=$ENABLE_TESTS \
  -DTUDAT_BUILD_WITH_ESTIMATION_TOOLS=$BUILD_ESTIMATION_TOOLS \
  -DTUDAT_BUILD_STATIC_LIBRARY=on \
  -DTUDAT_BUILD_TUDAT_TUTORIALS=off \
  -DTUDAT_BUILD_WITH_SOFA_INTERFACE=on \
  -DTUDAT_BUILD_WITH_SPICE_INTERFACE=on \
  -DTUDAT_BUILD_WITH_JSON_INTERFACE=on \
  -DTUDAT_SKIP_JSON_TESTS=$SKIP_JSON_TESTS \
  -DBoost_NO_BOOST_CMAKE=ON \
..
# https://github.com/lightspark/lightspark/issues/344
make -j$NPROC

ctest --verbose

make install
