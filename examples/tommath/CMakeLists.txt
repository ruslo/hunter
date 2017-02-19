cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-libtommath)

hunter_add_package(tommath)

find_package(tommath CONFIG REQUIRED)

add_executable(example-libtommath main.c)
target_link_libraries(example-libtommath tommath::tommath)
