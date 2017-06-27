cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")
project(libjson-rpc-cpp-example)

hunter_add_package(libjson-rpc-cpp)
find_package(libjson-rpc-cpp CONFIG REQUIRED)

# FIXME: libcrypto does not links to pthread.
find_package(Threads)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} libjson-rpc-cpp::client Threads::Threads)
