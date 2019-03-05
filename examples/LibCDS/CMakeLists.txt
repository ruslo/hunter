cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-LibCDS)

hunter_add_package(LibCDS)

find_package(LibCDS CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main LibCDS::cds)  # Use LibCDS::cds-s for static library
