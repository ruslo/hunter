cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-fmt)

hunter_add_package(fmt)

find_package(fmt CONFIG REQUIRED)

add_executable(fmtexample fmtexample.cpp)
target_link_libraries(fmtexample fmt::fmt)
