cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-benchmark)

hunter_add_package(benchmark)

find_package(benchmark CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main benchmark::benchmark)
