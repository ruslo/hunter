# Copyright (c) 2017 Zhuhao Wang
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-NASM)

hunter_add_package(NASM)

find_program(NASM_EXECUTABLE
  nasm
  HINTS
  ${NASM_ROOT}/bin
  NO_DEFAULT_PATH
  )

execute_process(
  COMMAND "${NASM_EXECUTABLE}" -v
  RESULT_VARIABLE result
  OUTPUT_VARIABLE output
  OUTPUT_STRIP_TRAILING_WHITESPACE
  )

if(NOT result EQUAL 0)
  message(FATAL_ERROR "NASM failed")
endif()

message("NASM version: ${output}")
