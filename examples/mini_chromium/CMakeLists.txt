# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mini_chromium)

# download mini_chromium
hunter_add_package(mini_chromium)

# now mini_chromium can be used
find_package(mini_chromium CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo mini_chromium::base)
