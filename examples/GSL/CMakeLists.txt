# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gsl)

# download gtest
hunter_add_package(GSL)

# now gtest can be used
find_package(GSL CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo GSL::gsl)
