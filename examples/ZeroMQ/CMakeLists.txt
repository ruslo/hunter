cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ZeroMQ)

hunter_add_package(ZeroMQ)

find_package(ZeroMQ CONFIG REQUIRED)

add_executable(version main.cpp)
target_link_libraries(version ZeroMQ::libzmq)

if(NOT CMAKE_SYSTEM_NAME STREQUAL Windows)
  add_executable(version-static main.cpp)
  target_link_libraries(version-static ZeroMQ::libzmq-static)
endif()
