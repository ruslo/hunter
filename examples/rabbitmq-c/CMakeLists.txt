# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-rabbitmq-c)

# download gtest
hunter_add_package(OpenSSL)
hunter_add_package(rabbitmq-c)

# now gtest can be used
find_package(rabbitmq-c CONFIG REQUIRED)

add_executable(foo amqp_bind.c)
target_link_libraries(foo rabbitmq-c::rabbitmq-static)
