cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-thrift)

hunter_add_package(thrift)

find_package(thrift CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main thrift::thrift_static)
