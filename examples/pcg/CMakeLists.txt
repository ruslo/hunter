cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

project(download-pcg)

hunter_add_package(pcg)

# DOCUMENTATION_START {
find_package(pcg CONFIG REQUIRED)
add_executable(main main.c)
target_link_libraries(main pcg::pcg_random)
# DOCUMENTATION_END }
