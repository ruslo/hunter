cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-pcg)

hunter_add_package(pcg)

# DOCUMENTATION_START {
find_package(pcg CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main pcg::pcg_random)
# DOCUMENTATION_END }
