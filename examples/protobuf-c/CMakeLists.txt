cmake_minimum_required(VERSION 3.1)

include("../common.cmake")

project(download-protobuf-c)

# DOCUMENTATION_START {
hunter_add_package(Protobuf)
find_package(Protobuf CONFIG REQUIRED)
hunter_add_package(protobuf-c)
find_package(protobuf-c CONFIG REQUIRED)
add_custom_command(
  OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/person.pb-c.c"
         "${CMAKE_CURRENT_BINARY_DIR}/person.pb-c.h"
  COMMAND protobuf::protoc
  ARGS --plugin=$<TARGET_FILE:protobuf-c::protoc-gen-c>
       --c_out=${CMAKE_CURRENT_BINARY_DIR}
       person.proto
  DEPENDS person.proto protobuf::protoc protobuf-c::protoc-gen-c
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
add_executable(main main.c
  "${CMAKE_CURRENT_BINARY_DIR}/person.pb-c.c"
  "${CMAKE_CURRENT_BINARY_DIR}/person.pb-c.h")
target_include_directories(main PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>)
target_link_libraries(main protobuf-c::protobuf-c)
# DOCUMENTATION_END }
