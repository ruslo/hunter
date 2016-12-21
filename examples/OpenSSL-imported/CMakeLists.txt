# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-openssl)

# download gtest
hunter_add_package(OpenSSL)

# now gtest can be used
find_package(OpenSSL REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo OpenSSL::SSL OpenSSL::Crypto)
