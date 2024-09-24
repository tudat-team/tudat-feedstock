mkdir build
cd build

:: TODO: DTUDAT_BUILD_WITH_ESTIMATION_TOOLS off doesn't work. Source code doesn't adjust correctly.
:: backslashes in %BUILD_PREFIX% causes errors in CMake when parsing strings
:: this line replaces backslashes with forward slashes for %BUILD_PREFIX%
set "BUILD_PREFIX=%BUILD_PREFIX:\=/%"
set BUILD_TESTS=1

cmake ^
    -G "NMake Makefiles" ^
    -DCMAKE_CXX_STANDARD=17 ^
    -DCMAKE_PREFIX_PATH=LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DTUDAT_BUILD_TESTS=%BUILD_TESTS% ^
    -DTUDAT_BUILD_WITH_ESTIMATION_TOOLS=1 ^
    -DTUDAT_BUILD_STATIC_LIBRARY=1 ^
    -DTUDAT_BUILD_TUDAT_TUTORIALS=0 ^
    -DTUDAT_BUILD_WITH_SOFA_INTERFACE=1 ^
    -DTUDAT_BUILD_WITH_JSON_INTERFACE=0 ^
    -DTUDAT_SKIP_BROKEN_MSVC_CLANG_PRECISION_TESTS=1 ^
    -DTUDAT_DOWNLOAD_AND_BUILD_BOOST=0 ^
    -DTUDAT_FORCE_DYNAMIC_RUNTIME=on ^
    -DTUDAT_DISABLE_MSVC_CLANG_CL_FLAGS=1 ^
    -D_ENABLE_EXTENDED_ALIGNED_STORAGE=on ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    ..
if errorlevel 1 exit 1

cmake --build . --config Release --target install

if errorlevel 1 exit 1

if %BUILD_TESTS%==1 (
    ctest --verbose
    if errorlevel 1 exit 1
)
if errorlevel 1 exit 1


