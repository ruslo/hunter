cmake_minimum_required(VERSION 3.0.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Catch)
set(CMAKE_CXX_STANDARD 11)

hunter_add_package(Catch)

include_directories(${CATCH_ROOT}/include)

file(GLOB SOURCES *.cpp)
add_executable(foo_test ${SOURCES})

enable_testing(true)
add_test(NAME foo_test COMMAND foo_test)
