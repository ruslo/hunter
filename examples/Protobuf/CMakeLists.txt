cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Hunter/config.cmake)
include("../common.cmake")
project(download-Protobuf)

# Compatibility Mode introduced by protobuf
# * see messages/CMakeList.txt for different usage
option(protobuf_MODULE_COMPATIBLE "use protobuf in module compatible mode" OFF)

# If we cross compile for Android or iOS build a separate protoc executable on host to compile .proto files in CMake
# TODO is there some better case to distinguish building separate protoc?
if (IOS OR ANDROID)
    # add host subdiretcory as seperate project [and reset CC and CXX for Android]
    include(hunter_experimental_add_host_subdirectory)
    hunter_experimental_add_host_subdirectory(host ENV_VARS CC CXX)

    file(READ "${CMAKE_CURRENT_BINARY_DIR}/host-build/path.to.protoc" host_protoc)
    add_executable(protobuf::protoc IMPORTED)
    set_property(TARGET protobuf::protoc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
    set_target_properties(protobuf::protoc PROPERTIES IMPORTED_LOCATION_RELEASE "${host_protoc}")
    message(STATUS "Using imported protoc from host: ${host_protoc}")
endif (IOS OR ANDROID)

# Normal behaviour from here on
hunter_add_package(Protobuf)

find_package(Protobuf CONFIG REQUIRED)

# Protobuf example based on:
# https://github.com/shaochuan/cmake-protobuf-example

add_subdirectory(messages)

add_executable(hello main.cpp)
target_link_libraries(hello messages)
