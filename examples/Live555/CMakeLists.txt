# Copyright (c) 2015-2017, Ruslan Baratov Ernesto Varoli
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Live555)

hunter_add_package(Live555)

find_package(Live555 REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo Live555::LiveMedia)
target_link_libraries(foo Live555::Groupsock)
target_link_libraries(foo Live555::UsageEnvironment)
target_link_libraries(foo Live555::BasicUsageEnvironment)


