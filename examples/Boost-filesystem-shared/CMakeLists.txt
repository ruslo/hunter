# Copyright (c) 2013-2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake) #set BUILD_SHARED_LIBS=ON
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost COMPONENTS system filesystem)

# now boost can be used
find_package(Boost CONFIG REQUIRED system filesystem)

add_executable(foo foo.cpp)

target_link_libraries(foo Boost::system Boost::filesystem)