# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# download boost
hunter_add_package(Boost)

# now boost can be used
find_package(Boost CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo Boost::boost)

# Create license with Boost's license under 3rd party
if(NOT EXISTS "${Boost_LICENSE}")
  message(FATAL_ERROR "License file not found")
endif()

file(READ "${Boost_LICENSE}" boost_license_content)

set(project_license "${CMAKE_CURRENT_BINARY_DIR}/LICENSE.txt")
file(
    WRITE
    "${project_license}"
    "Some info about this project license.\n\n"
    "== 3rd party licenses ==\n\n"
    "== Boost ==\n\n"
    "${boost_license_content}"
)
message("Project license: ${project_license}")

# Compatibility mode
find_package(Boost REQUIRED)
include_directories("${Boost_INCLUDE_DIRS}")
