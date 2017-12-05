cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-c-ares)

hunter_add_package(c-ares)

find_package(c-ares CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main c-ares::cares)
