# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-onnx)

# DOCUMENTATION_START {
hunter_add_package(ONNX)
find_package(ONNX CONFIG REQUIRED)

add_executable(test test.cpp)
target_link_libraries(test PUBLIC onnx::onnx onnx::onnxifi)
# DOCUMENTATION_END }
