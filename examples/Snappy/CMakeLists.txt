cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-snappy)

hunter_add_package(Snappy)
find_package(Snappy CONFIG REQUIRED)

add_executable(snappy_compress_test main.cpp)
target_link_libraries(snappy_compress_test Snappy::snappy)
