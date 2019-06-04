# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-pcre2)

# DOCUMENTATION_START {
hunter_add_package(pcre2)
find_package(PCRE2 CONFIG REQUIRED)

add_executable(boo boo.c)
target_link_libraries(boo PUBLIC PCRE2::pcre2-8)
# DOCUMENTATION_END }
