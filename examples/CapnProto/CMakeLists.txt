cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-capnproto)

hunter_add_package(CapnProto)

find_package(CapnProto CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo CapnProto::capnp)
