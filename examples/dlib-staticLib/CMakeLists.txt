# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake) #set DLIB_HEADER_ONLY=OFF
include("../common.cmake")

project(download-dlib)

hunter_add_package(dlib)
find_package(dlib CONFIG REQUIRED)

add_executable(timer_ex timer_ex.cpp)
target_link_libraries(timer_ex dlib::dlib)
