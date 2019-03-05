cmake_minimum_required(VERSION 3.2)

include("../common.cmake")

project(download-soil)

# DOCUMENTATION_START {
hunter_add_package(soil)
find_package(soil CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main soil::soil)
# DOCUMENTATION_END }
