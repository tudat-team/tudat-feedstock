mkdir build
cd build

:: TODO: DTUDAT_BUILD_WITH_ESTIMATION_TOOLS off doesn't work. Source code doesn't adjust correctly.
:: backslashes in %BUILD_PREFIX% causes errors in CMake when parsing strings
:: this line replaces backslashes with forward slashes for %BUILD_PREFIX%
set "BUILD_PREFIX=%BUILD_PREFIX:\=/%"
set BUILD_TESTS=0

cmake ^
    -DCMAKE_C_COMPILER=cl.exe ^
    -DCMAKE_CXX_COMPILER=cl.exe ^
    -DCMAKE_PREFIX_PATH=LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DTUDAT_BUILD_TESTS=%BUILD_TESTS% ^
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


