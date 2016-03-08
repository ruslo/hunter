cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ZMQPP)

hunter_add_package(ZMQPP)

find_package(ZMQPP CONFIG REQUIRED)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
add_executable(version main.cpp)
target_link_libraries(version ZMQPP::zmqpp)
