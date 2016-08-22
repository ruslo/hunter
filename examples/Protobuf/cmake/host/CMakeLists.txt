# CMake project to install protobuf::protoc from hunter Protobuf package
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../../../common.cmake")

project(download-Protobuf-host)

hunter_add_package(Protobuf)
