cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-fruit)

# DOCUMENTATION_START {
hunter_add_package(Fruit)
find_package(Fruit CONFIG REQUIRED)

add_executable(foo foo.cpp)

target_link_libraries(foo PRIVATE Fruit::fruit)
# DOCUMENTATION_END }
