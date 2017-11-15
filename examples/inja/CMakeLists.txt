# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-inja)

set(CMAKE_CXX_STANDARD 11)
if(WIN32 AND MSVC AND MSVC_VERSION LESS 1900)
    message(FATAL_ERROR "[${PROJECT_NAME}] Visual Studio < 2015 is not supported.")
endif()

hunter_add_package(inja)
find_package(inja CONFIG REQUIRED)

add_executable(inja inja.cpp)
target_link_libraries(inja inja::inja)