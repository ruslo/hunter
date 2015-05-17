# Copyright (c) 2015, Aaditya Kalsi
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(boost_iostreams)

# download boost
hunter_add_package(Boost COMPONENTS iostreams)

# now boost can be used
find_package(Boost CONFIG REQUIRED iostreams)
add_executable(foo foo.cpp)
target_link_libraries(foo Boost::iostreams)

# Compatibility mode
set(Boost_USE_STATIC_LIBS ON)
if(MSVC)
  add_definitions(-DBOOST_ALL_NO_LIB=1)
endif()
find_package(Boost REQUIRED iostreams)
include_directories(${Boost_INCLUDE_DIRS})
target_link_libraries(foo ${Boost_LIBRARIES})
