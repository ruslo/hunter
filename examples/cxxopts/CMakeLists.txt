# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cxxopts)
hunter_add_package(cxxopts)
find_package(cxxopts CONFIG REQUIRED)

if(HUNTER_cxxopts_VERSION VERSION_LESS "2.0.0")
  set(source_dir "v1.x.x")
elseif(HUNTER_cxxopts_VERSION VERSION_EQUAL "2.1.1-pre")
  set(source_dir "v2.0.0")
else()
  set(source_dir "v${HUNTER_cxxopts_VERSION}")
endif()

add_executable(foo "${source_dir}/example.cpp")
target_link_libraries(foo PUBLIC cxxopts::cxxopts)
