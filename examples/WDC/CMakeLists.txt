# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.3)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-wdc)

hunter_add_package(WDC)
find_package(WDC CONFIG REQUIRED)

hunter_add_package(OpenSSL)
find_package(OpenSSL REQUIRED)
hunter_add_package(CURL)
find_package(CURL CONFIG REQUIRED)
hunter_add_package(pugixml)
find_package(pugixml CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CXX_STANDARD_REQUIRED ON)
add_executable(example init.cpp)
target_link_libraries(example wdc)
