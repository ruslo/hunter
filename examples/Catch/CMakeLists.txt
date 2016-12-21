cmake_minimum_required(VERSION 3.0.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Catch)
set(CMAKE_CXX_STANDARD 11)

hunter_add_package(Catch)

find_package(Catch CONFIG REQUIRED)
include_directories(${CATCH_INCLUDE_DIR})

file(GLOB SOURCES *.cpp)
add_executable(foo_test ${SOURCES})

enable_testing(true)
add_test(NAME foo_test COMMAND foo_test)
