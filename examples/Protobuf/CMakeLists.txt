cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Protobuf)

hunter_add_package(Protobuf)

find_package(Protobuf CONFIG REQUIRED)

# Protobuf example based on:
# https://github.com/shaochuan/cmake-protobuf-example

add_subdirectory(messages)

# path to generated headers
include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(hello main.cpp)
target_link_libraries(hello messages Protobuf::libprotobuf)
                                     
