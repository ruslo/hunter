# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

# Need NASM on Windows to compile asm code
if(WIN32)
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
endif()

project(download-openssl)

hunter_add_package(OpenSSL)
find_package(OpenSSL REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC OpenSSL::SSL OpenSSL::Crypto)
