# CMake project to install protobuf::protoc from hunter Protobuf package
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Hunter/config.cmake) # skip debug and lite version
include("../../../common.cmake")

project(download-Protobuf-host)

hunter_add_package(Protobuf)
