mkdir build
cd build

:: TODO: DTUDAT_BUILD_WITH_ESTIMATION_TOOLS off doesn't work. Source code doesn't adjust correctly.
:: backslashes in %BUILD_PREFIX% causes errors in CMake when parsing strings
:: this line replaces backslashes with forward slashes for %BUILD_PREFIX%
set "BUILD_PREFIX=%BUILD_PREFIX:\=/%"

cmake ^
    -G "NMake Makefiles" ^
    -DCMAKE_CXX_STANDARD=17 ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DTUDAT_BUILD_TESTS=1 ^
    -DTUDAT_BUILD_WITH_ESTIMATION_TOOLS=1 ^
    -DTUDAT_BUILD_STATIC_LIBRARY=1 ^
    -DTUDAT_BUILD_TUDAT_TUTORIALS=0 ^
    -DTUDAT_BUILD_WITH_SOFA_INTERFACE=1 ^
    -DTUDAT_BUILD_WITH_JSON_INTERFACE=0 ^
    -DTUDAT_DOWNLOAD_AND_BUILD_BOOST=0 ^
    -DTUDAT_FORCE_DYNAMIC_RUNTIME=on ^
    -D_ENABLE_EXTENDED_ALIGNED_STORAGE=on ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -D_GLIBCXX_USE_CXX11_ABI=0 ^
    ..
if errorlevel 1 exit 1

cmake --build . --config RelWithDebInfo --target install
if errorlevel 1 exit 1

ctest --verbose
if errorlevel 1 exit 1


