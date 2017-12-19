# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Urho3D)

hunter_add_package(Urho3D)
find_package(Urho3D CONFIG REQUIRED)

add_executable(
    LuaIntegration
    WIN32
    LuaIntegration.h
    LuaIntegration.cpp
)
target_link_libraries(LuaIntegration PUBLIC Urho3D::Urho3D)

if(WIN32)
  set(resources "${URHO3D_ROOT}/share/Resources")
else()
  set(resources "${URHO3D_ROOT}/share/Urho3D/Resources")
endif()

enable_testing()
add_test(NAME LuaIntegration COMMAND LuaIntegration -pp "${resources}")
