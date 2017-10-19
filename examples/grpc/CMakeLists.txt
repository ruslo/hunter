cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-grpc)

hunter_add_package(grpc)

find_package(grpc CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main grpc::grpc)
