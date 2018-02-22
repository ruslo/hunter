
# by Cyberunner23
# for the Hunter project

cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

hunter_add_package(TCLAP)
find_package(TCLAP CONFIG REQUIRED)

add_executable(foo main.cpp)
target_link_libraries(foo TCLAP::TCLAP)

