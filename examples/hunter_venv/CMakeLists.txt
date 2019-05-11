# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.12)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-hunter_venv)

# DOCUMENTATION_START {
hunter_add_package(hunter_venv)
find_package(hunter_venv CONFIG REQUIRED)

find_package(Python REQUIRED)

add_custom_target(python_version ALL Python::Interpreter --version)

execute_process(COMMAND ${Python_EXECUTABLE} --version RESULT_VARIABLE result)
if(NOT result EQUAL "0")
  message(FATAL_ERROR "Failed")
endif()
# DOCUMENTATION_END }

# DOCUMENTATION_START_1 {
execute_process(
    COMMAND ${Python_EXECUTABLE} -c "import sys"
    RESULT_VARIABLE result
)
# DOCUMENTATION_END_1 }
if(NOT result EQUAL "0")
  message(FATAL_ERROR "Failed")
endif()

# DOCUMENTATION_START_2 {
execute_process(
    COMMAND ${Python_EXECUTABLE} -c "print ('Hello Hunter!')"
    RESULT_VARIABLE result
)
# DOCUMENTATION_END_2 }
if(NOT result EQUAL "0")
  message(FATAL_ERROR "Failed")
endif()

# DOCUMENTATION_START_3 {
execute_process(
    COMMAND ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/script.py
    RESULT_VARIABLE result
)
# DOCUMENTATION_END_3 }
if(NOT result EQUAL "0")
  message(FATAL_ERROR "Failed")
endif()
