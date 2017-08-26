cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(example-stormlib)

hunter_add_package(stormlib)

find_package(stormlib CONFIG REQUIRED)

add_executable(example-stormlib main.cpp)
target_link_libraries(example-stormlib stormlib::stormlib)
