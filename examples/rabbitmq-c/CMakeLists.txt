# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-rabbitmq-c)

hunter_add_package(rabbitmq-c)

find_package(rabbitmq-c REQUIRED)

add_executable(foo amq_bind.c utils.c)
target_link_libraries(foo rabbitmq-c::rabbitmq-static)
