cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ZeroMQ)

hunter_add_package(ZeroMQ)

find_package(PkgConfig)
set(PKG_CONFIG_USE_CMAKE_PREFIX_PATH ON)
pkg_search_module(ZeroMQ REQUIRED libzmq)

include_directories(${ZeroMQ_INCLUDE_DIRS})
link_directories(${ZeroMQ_LIBRARY_DIRS})


add_executable(version main.cpp)
target_link_libraries(version ${ZeroMQ_LIBRARIES})
