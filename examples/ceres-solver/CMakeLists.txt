cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-ceres-solver)

hunter_add_package(ceres-solver)

find_package(Ceres CONFIG REQUIRED)

add_executable(ceres-solver-example foo.cpp)
target_link_libraries(foo Ceres glog)
