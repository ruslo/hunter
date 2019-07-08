# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-readline)

# DOCUMENTATION_START {
# readline depends on a termcap implementation.  One
# option is to use ncurses.
hunter_add_package(ncursesw)
find_package(ncursesw CONFIG REQUIRED)

hunter_add_package(readline)
find_package(readline REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC readline::readline PkgConfig::ncursesw)
# DOCUMENTATION_END }
