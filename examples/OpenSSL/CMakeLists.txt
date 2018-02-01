# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-openssl)

hunter_add_package(OpenSSL)
find_package(OpenSSL REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC OpenSSL::SSL OpenSSL::Crypto)
