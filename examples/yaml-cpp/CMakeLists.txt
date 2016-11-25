cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-yaml-cpp)

hunter_add_package(yaml-cpp)

find_package(yaml-cpp CONFIG REQUIRED)


add_executable(parse parse.cpp)
target_link_libraries(parse yaml-cpp::yaml-cpp)
