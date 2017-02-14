cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

set(CMAKE_CXX_STANDARD 14)

project(download-mpark_variant)

hunter_add_package(mpark_variant)

find_package(mpark_variant CONFIG REQUIRED)

add_executable(example main.cpp)
target_link_libraries(example mpark_variant)
