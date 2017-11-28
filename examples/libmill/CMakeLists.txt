cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-libevent)

hunter_add_package(libmill)

find_package(libmill CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main libmill::mill_s)
