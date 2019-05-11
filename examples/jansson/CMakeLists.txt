cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-jansson)

# DOCUMENTATION_START {
hunter_add_package(jansson)
find_package(jansson CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main jansson::jansson)
# DOCUMENTATION_END }
