# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS system chrono)
find_package(Boost CONFIG REQUIRED system chrono)

add_executable(foo foo.cpp)
target_link_libraries(
    foo
    PUBLIC
    Boost::chrono
    Boost::system # Should be last
        # Boost 1.66.0, Linux, Clang with -stdlib=libstdc++:
        # * https://travis-ci.org/ingenue/hunter/jobs/318140468#L2651
)
