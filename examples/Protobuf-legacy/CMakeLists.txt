cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Protobuf)

# Compatibility Mode introduced by protobuf
# * see examples/Protobuf for usage of protobuf_MODULE_COMPATIBLE=OFF
option(protobuf_MODULE_COMPATIBLE "use protobuf in module compatible mode" ON)

# If we cross compile for Android or iOS build a separate protoc executable on host to compile .proto files in CMake
if(IOS OR ANDROID)
  # add cmake/host subdiretcory as host project to install protoc
  include(hunter_experimental_add_host_project)
  hunter_experimental_add_host_project(cmake/host)

  add_executable(host-protoc IMPORTED)
  set_property(TARGET host-protoc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
  set_target_properties(host-protoc PROPERTIES IMPORTED_LOCATION_RELEASE "${HUNTER_HOST_ROOT}/bin/protoc")
  set(Protobuf_PROTOC_EXECUTABLE host-protoc)

  message(STATUS "Using imported protoc from host: ${HUNTER_HOST_ROOT}/bin/protoc")
endif(IOS OR ANDROID)

hunter_add_package(Protobuf)

find_package(Protobuf CONFIG REQUIRED)

# Protobuf example based on:
# https://github.com/shaochuan/cmake-protobuf-example

add_subdirectory(messages)

add_executable(hello main.cpp)
target_link_libraries(hello messages)
