# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.8)
project(download-boost)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_VERBOSE_MAKEFILE YES)

# Let hunter be more verbose
set(HUNTER_STATUS_DEBUG ON CACHE BOOL "")

# emulate ${HUNTER_ROOT}/cmake/Hunter
include("../common.cmake")
include(hunter_add_package)

# download boost
hunter_add_package(Boost COMPONENTS filesystem system)

# now boost can be used
find_package(Boost 1.55 REQUIRED COMPONENTS filesystem system)
message("Boost includes: ${Boost_INCLUDE_DIRS}")
include_directories(${Boost_INCLUDE_DIRS})

### create targets
add_executable(mytest test.cpp)
target_link_libraries(mytest ${Boost_LIBRARIES})

enable_testing()
add_test("simple" mytest)
