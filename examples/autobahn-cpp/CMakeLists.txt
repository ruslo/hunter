cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-autobahn-cpp)

hunter_add_package(autobahn-cpp)

set (CMAKE_CXX_STANDARD 11)

find_package(autobahn-cpp CONFIG REQUIRED)

add_executable(test_autobahn-cpp websocket_callee.cpp parameters.cpp)
target_link_libraries(test_autobahn-cpp autobahn-cpp::autobahn-cpp)
