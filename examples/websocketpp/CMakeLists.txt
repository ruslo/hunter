cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-websocketpp)

hunter_add_package(websocketpp)

find_package(websocketpp CONFIG REQUIRED)

add_executable(version main.cpp)
target_link_libraries(version websocketpp::websocketpp)
