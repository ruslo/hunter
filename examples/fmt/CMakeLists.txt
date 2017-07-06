cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-fmt)

hunter_add_package(fmt)

set (CMAKE_CXX_STANDARD 11)

find_package(fmt CONFIG REQUIRED)

add_executable(fmtexample fmtexample.cpp)
target_link_libraries(fmtexample fmt::fmt)
