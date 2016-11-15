cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_opencl_headers)

hunter_add_package(OpenCL_Headers)
find_package(OpenCL_Headers CONFIG REQUIRED)

add_executable(opencl_headers_test main.cpp)
target_link_libraries(opencl_headers_test OpenCL_Headers::OpenCL_Headers)
