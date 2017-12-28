# Copyright (c) 2017, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.1)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-globjects)

hunter_add_package(globjects)

string(COMPARE EQUAL "${globjects_LICENSES}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Licenses not found")
endif()

message("globjects licenses:")
foreach(x ${globjects_LICENSES})
  message("* ${x}")
  if(NOT EXISTS "${globjects_LICENSES}")
    message(FATAL_ERROR "File not found")
  endif()
endforeach()

find_package(globjects CONFIG REQUIRED)

# Test double library creation
find_package(globjects CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo globjects::globjects)

# globjects needs at least this c++11 feature
target_compile_features(foo PRIVATE cxx_defaulted_move_initializers)
