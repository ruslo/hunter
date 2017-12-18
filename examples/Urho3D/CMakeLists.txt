# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Urho3D)

hunter_add_package(Urho3D)
find_package(Urho3D CONFIG REQUIRED)

add_executable(
    SkeletalAnimation
    WIN32
    Mover.cpp
    Mover.h
    SkeletalAnimation.cpp
    SkeletalAnimation.h
)
target_link_libraries(SkeletalAnimation PUBLIC Urho3D::Urho3D)

if(WIN32)
  set(resources "${URHO3D_ROOT}/share/Resources")
else()
  set(resources "${URHO3D_ROOT}/share/Urho3D/Resources")
endif()

enable_testing()
add_test(NAME SkeletalAnimation COMMAND SkeletalAnimation -pp "${resources}")
