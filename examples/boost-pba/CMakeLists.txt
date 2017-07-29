# Copyright (c) 2017, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")
include("../common.cmake")

project(download-boost-pba)

hunter_add_package(boost-pba) 
find_package(boost-pba CONFIG REQUIRED)

add_executable(boost-pba-test main.cpp)
target_link_libraries(boost-pba-test boost-pba::boost-pba)
