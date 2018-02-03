# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SFML)

hunter_add_package(SFML)
find_package(SFML CONFIG REQUIRED)

add_executable(sfml_example main.cpp)
target_link_libraries(sfml_example SFML::system SFML::window SFML::graphics SFML::network SFML::audio)
