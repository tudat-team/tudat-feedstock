#!/usr/bin/env bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  ENABLE_TESTS=false
  BUILD_ESTIMATION_TOOLS=true
  SKIP_JSON_TESTS=false
else
  ENABLE_TESTS=false
  BUILD_ESTIMATION_TOOLS=true
  SKIP_JSON_TESTS=true
fi

mkdir build

cd build

cmake \
  -DCMAKE_CXX_STANDARD=17 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DTUDAT_BUILD_TESTS=$ENABLE_TESTS \
  -DTUDAT_BUILD_WITH_ESTIMATION_TOOLS=$BUILD_ESTIMATION_TOOLS \
  -DTUDAT_BUILD_WITH_NRLMSISE00=on \
  -DTUDAT_BUILD_STATIC_LIBRARY=on \
  -DTUDAT_BUILD_TUDAT_TUTORIALS=off \
  -DTUDAT_BUILD_WITH_SOFA_INTERFACE=on \
  -DTUDAT_BUILD_WITH_JSON_INTERFACE=off \
  -DTUDAT_SKIP_JSON_TESTS=$SKIP_JSON_TESTS \
  -DBoost_NO_BOOST_CMAKE=ON \
  ..
# https://github.com/lightspark/lightspark/issues/344
make -j$(($(nproc) + 1))

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  if [[ "$ENABLE_TESTS" == "true" ]]; then
    ctest --verbose
  fi
fi

make install
