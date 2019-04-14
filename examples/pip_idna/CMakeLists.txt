# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.12)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-pip_idna)

# DOCUMENTATION_START {
hunter_add_package(pip_idna)
find_package(pip_idna CONFIG REQUIRED)

set(test_command "import idna")

execute_process(
    COMMAND
    ${Python_EXECUTABLE} -c ${test_command}
    RESULT_VARIABLE
    result
)

if(NOT result EQUAL "0")
  message(FATAL_ERROR "Failed")
endif()
# DOCUMENTATION_END }
