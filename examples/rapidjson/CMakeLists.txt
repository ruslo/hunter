# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-rapidjson)

# download rapidjson
hunter_add_package(RapidJSON)

# now rapidjson can be used
find_package(RapidJSON CONFIG REQUIRED)

add_executable(condense condense.cpp)
target_link_libraries(condense RapidJSON::rapidjson)
