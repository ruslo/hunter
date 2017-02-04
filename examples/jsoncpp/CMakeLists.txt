cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-jsoncpp)

hunter_add_package(jsoncpp)

find_package(jsoncpp CONFIG REQUIRED)

add_executable(version main.cpp)

target_link_libraries(version jsoncpp_lib_static)
