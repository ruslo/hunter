# Copyright (c) 2017, NeroBurner
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-globjects)

# DOCUMENTATION_START {
hunter_add_package(globjects)
find_package(globjects CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PRIVATE globjects::globjects)
# DOCUMENTATION_END }

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

# Test double library creation
find_package(globjects CONFIG REQUIRED)

# globjects needs at least this c++11 feature
target_compile_features(foo PRIVATE cxx_defaulted_move_initializers)
