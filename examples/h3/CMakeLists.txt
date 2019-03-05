cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-h3)

hunter_add_package(h3)

# DOCUMENTATION_START {
find_package(h3 CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main h3::h3)
# DOCUMENTATION_END }
