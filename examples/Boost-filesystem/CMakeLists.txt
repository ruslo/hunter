# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost COMPONENTS filesystem)

# now boost can be used
set(Boost_USE_STATIC_LIBS ON)
if(MSVC)
  add_definitions(-DBOOST_ALL_NO_LIB=1)
endif()
find_package(Boost 1.55 REQUIRED filesystem)
message("Boost libraries: ${Boost_LIBRARIES}")
