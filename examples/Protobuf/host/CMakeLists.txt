# CMake project to simply install protobuf::protoc from hunter Protoc package
# and write the path to it into a known file
cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(HUNTER_TESTING_CONFIG_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Hunter/config.cmake)
include("../../common.cmake")

project(download-Protobuf-host)

# only build protoc
hunter_add_package(Protobuf)

file(WRITE "${CMAKE_BINARY_DIR}/path.to.protoc" "${PROTOBUF_ROOT}/bin/protoc")
#find_package(Protobuf CONFIG REQUIRED)
