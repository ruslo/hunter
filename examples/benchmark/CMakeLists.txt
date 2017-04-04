cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-benchmark)

set(CMAKE_CXX_STANDARD 98)

hunter_add_package(benchmark)

find_package(benchmark CONFIG REQUIRED)

set(SOURCES foo.cpp)

add_executable(benchmark_test ${SOURCES})
target_link_libraries(benchmark_test PUBLIC benchmark::benchmark)

enable_testing(true)
add_test(NAME benchmark_test COMMAND benchmark_test)
