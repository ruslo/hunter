cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-ceres-solver)

hunter_add_package(ceres-solver)

#set(CERES_EIGEN_VERSION 3.2.4)

find_package(Ceres CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo ceres glog)
