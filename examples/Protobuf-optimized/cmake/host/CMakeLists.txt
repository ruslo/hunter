# CMake project to install protobuf::protoc from hunter Protobuf package
cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include(${CMAKE_CURRENT_SOURCE_DIR}/../../../../gate/cmake/HunterGate.cmake)
HunterGate(
    URL "${HUNTER_HOST_URL}"
    SHA1 "${HUNTER_HOST_SHA1}"
    FILEPATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Hunter/config.cmake # skip debug and lite version
)

project(download-Protobuf-host)

hunter_add_package(Protobuf)
