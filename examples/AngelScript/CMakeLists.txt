# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-AngelScript)

hunter_add_package(AngelScript)
find_package(AngelScript CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC AngelScript::AngelScript)
