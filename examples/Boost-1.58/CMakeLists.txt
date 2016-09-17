# Copyright (c) 2013-2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS filesystem system serialization iostreams)
find_package(Boost CONFIG REQUIRED filesystem system serialization iostreams)

add_executable(foo foo.cpp)
target_link_libraries(foo Boost::filesystem Boost::system Boost::serialization Boost::iostreams)
