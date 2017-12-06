# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SDL_ttf)

hunter_add_package(SDL_ttf)
find_package(SDL_ttf CONFIG REQUIRED)

add_executable(SDL_ttf main.cpp)
target_link_libraries(SDL_ttf SDL_ttf::SDL_ttf)
