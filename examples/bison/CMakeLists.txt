cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-bison)

hunter_add_package(bison)
find_package(BISON REQUIRED)

BISON_TARGET(rpcalc rpcalc.y ${CMAKE_CURRENT_BINARY_DIR}/rpcalc.cpp)
add_executable(rpcalc ${BISON_rpcalc_OUTPUTS})
