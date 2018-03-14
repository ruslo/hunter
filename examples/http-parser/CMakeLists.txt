cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-http-parser)

# DOCUMENTATION_START {
hunter_add_package(http-parser)
find_package(http-parser CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main http-parser::http_parser)
# DOCUMENTATION_END }
