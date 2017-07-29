cmake_minimum_required (VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("${CMAKE_CURRENT_SOURCE_DIR}/../common.cmake")

project(download-czmq)

#set(THREADS_PREFER_PTHREAD_FLAG ON)

hunter_add_package(czmq)
find_package(czmq REQUIRED CONFIG)

add_executable(main main.cpp)
target_link_libraries(main czmq::czmq)
