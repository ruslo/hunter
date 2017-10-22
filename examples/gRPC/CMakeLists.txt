cmake_minimum_required(VERSION 3.1)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)
include("../common.cmake")

project(download-gRPC)

hunter_add_package(gRPC)

set(CMAKE_CXX_STANDARD_REQUIRED true)
set(CMAKE_CXX_STANDARD 11)

find_package(gRPC CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main gRPC::grpc)
