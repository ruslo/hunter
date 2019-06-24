# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gst_plugins_good)

hunter_add_package(gst_plugins_good)

# gstreamer-plugins-base-1.0 is a dependency, and they should share the same paths, so it is safe to use its config
find_package(gstreamer-plugins-base-1.0 CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC PkgConfig::gstreamer-plugins-base-1.0)
