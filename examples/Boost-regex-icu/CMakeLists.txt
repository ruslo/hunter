# Copyright (c) 2013, 2019 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS regex)
find_package(Boost CONFIG REQUIRED regex)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::regex)
