# Copyright (c) 2013, Ruslan Baratov
# Modified work: Copyright (c) 2018, Gregory Kramida
# All rights reserved.

cmake_minimum_required(VERSION 3.2)
option(HUNTER_BUILD_SHARED_LIBS "..." ON)

# Configure:
set(PYTHON_VERSION 3.5)
set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

# Requires python version 3.5. Change this in config.cmake if necessary.
hunter_add_package(Boost COMPONENTS python)
find_package(Boost CONFIG REQUIRED python35)
find_package(PythonLibs ${PYTHON_VERSION} EXACT REQUIRED)

PYTHON_ADD_MODULE(foo foo.cpp)
target_link_libraries(
    foo
    PUBLIC
    Boost::python35
    ${PYTHON_LIBRARIES}
)
target_include_directories(
  foo
  PUBLIC
  ${PYTHON_INCLUDE_DIR}
)
