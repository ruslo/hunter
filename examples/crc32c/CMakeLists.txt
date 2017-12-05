cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-crc32c)

hunter_add_package(crc32c)

find_package(crc32c CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_executable(main main.cpp)
target_link_libraries(main crc32c::crc32c)
