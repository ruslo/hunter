cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-msgpack)

hunter_add_package(msgpack)

set (CMAKE_CXX_STANDARD 11)

find_package(msgpack CONFIG REQUIRED)

add_executable(container container.cpp)
target_link_libraries(container msgpack::msgpack)
