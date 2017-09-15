cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-double-conversion)

hunter_add_package(double-conversion)

# now double-conversion can be used
find_package(double-conversion CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main double-conversion::double-conversion)
