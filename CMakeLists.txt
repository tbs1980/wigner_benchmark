cmake_minimum_required(VERSION 2.8)

project(wigner_bench_test CXX Fortran)

#add the customised package searches to the module path
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)


find_package(HEALPix REQUIRED)
find_package(PolSpice REQUIRED)
find_package(WignerSymbols REQUIRED)

include_directories(${WignerSymbols_INCLUDE_DIR})

add_executable(wigner_bench.exe wigner_bench.cpp)
target_link_libraries(wigner_bench.exe ${WignerSymbols_LIBRARIES} ${PolSpice_LIBRARIES} gfortran)
