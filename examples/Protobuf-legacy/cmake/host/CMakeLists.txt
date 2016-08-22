# CMake project to simply install protobuf::protoc from hunter Protoc package
# and write the path to it into a known file
cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH cmake/Hunter/config.cmake)
include("../../../common.cmake")

project(download-Protobuf-host)

# only build protoc
hunter_add_package(Protobuf)

# write the install-root-dir into file for target project
file(WRITE "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/install-root-dir" "${PROTOBUF_ROOT}")
