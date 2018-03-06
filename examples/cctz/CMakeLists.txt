cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-cctz)

hunter_add_package(cctz)

find_package(cctz CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main cctz::cctz)
