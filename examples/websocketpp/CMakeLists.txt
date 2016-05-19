cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-websocketpp)

hunter_add_package(websocketpp)

find_package(websocketpp CONFIG REQUIRED)

set (CMAKE_CXX_STANDARD 11)

add_executable(openssl_example echo_server_both.cpp)
target_link_libraries(openssl_example websocketpp::websocketpp)

add_executable(version main.cpp)
target_link_libraries(version websocketpp::websocketpp)
