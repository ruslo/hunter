# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-xgboost)

# download xgboost
hunter_add_package(xgboost)

# now xgboost can be used
find_package(xgboost CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo xgboost::xgboost)
