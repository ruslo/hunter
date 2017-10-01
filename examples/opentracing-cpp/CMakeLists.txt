cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-opentracing-cpp)

set(CMAKE_CXX_STANDARD_REQUIRED true)
set(CMAKE_CXX_STANDARD 11)

hunter_add_package(opentracing-cpp)

find_package(OpenTracing CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main OpenTracing::opentracing-static)
