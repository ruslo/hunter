cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cppnetliburi)

hunter_add_package(CppNetlibUri)

find_package(CppNetlibUri CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo network-uri)
