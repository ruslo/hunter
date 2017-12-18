# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-bullet)

hunter_add_package(bullet)
find_package(bullet CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(
    boo
    PUBLIC
    bullet::BulletCollision
    bullet::BulletDynamics
    bullet::BulletSoftBody
    bullet::LinearMath
)
