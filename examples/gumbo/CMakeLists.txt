cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-gumbo)

hunter_add_package(gumbo)

find_package(gumbo CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main gumbo::gumbo)
