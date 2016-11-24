cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-YAML_CPP)

hunter_add_package(YAML_CPP)

find_package(YAML_CPP CONFIG REQUIRED)


add_executable(parse parse.cpp)
target_link_libraries(parse YAML_CPP::yaml-cpp)
