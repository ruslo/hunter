cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_opencl)

hunter_add_package(OpenCL)
find_package(OpenCL CONFIG REQUIRED)

add_executable(opencl_test main.cpp)
target_link_libraries(opencl_test OpenCL::OpenCL)
