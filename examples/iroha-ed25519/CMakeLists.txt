# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-iroha-ed25519)

# DOCUMENTATION_START {
hunter_add_package(iroha-ed25519)
find_package(ed25519 CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC iroha::ed25519)
# DOCUMENTATION_END }
