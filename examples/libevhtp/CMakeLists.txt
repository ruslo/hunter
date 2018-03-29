cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-libevhtp)

# DOCUMENTATION_START {
hunter_add_package(libevhtp)
find_package(libevhtp CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main libevhtp::evhtp)
# DOCUMENTATION_END }
