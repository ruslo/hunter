# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterUnPackDirectory)

include(hunter_pack_directory)
include(hunter_unpack_directory)

set(temp "${CMAKE_CURRENT_BINARY_DIR}/temp")
set(HUNTER_CACHED_ROOT "${temp}/root")
set(HUNTER_INSTALL_PREFIX "${temp}/install")

set(dir_to_pack "${temp}/topack")

file(WRITE "${dir_to_pack}/1.txt" "hello")
file(WRITE "${dir_to_pack}/B/2.txt" "boo")
file(WRITE "${dir_to_pack}/B/C/3.txt" "foo")

set(dest_dir "${HUNTER_CACHED_ROOT}/_Base/Cache/raw")

hunter_pack_directory("${dir_to_pack}" "${dest_dir}" result_sha1)

hunter_unpack_directory(${result_sha1})

set(expected_1 "${HUNTER_INSTALL_PREFIX}/1.txt")
set(expected_2 "${HUNTER_INSTALL_PREFIX}/B/2.txt")
set(expected_3 "${HUNTER_INSTALL_PREFIX}/B/C/3.txt")

if(NOT EXISTS "${expected_1}")
  message(FATAL_ERROR "Not found: ${expected_1}")
endif()

if(NOT EXISTS "${expected_2}")
  message(FATAL_ERROR "Not found: ${expected_2}")
endif()

if(NOT EXISTS "${expected_3}")
  message(FATAL_ERROR "Not found: ${expected_3}")
endif()

file(READ "${expected_1}" content_1)
file(READ "${expected_2}" content_2)
file(READ "${expected_3}" content_3)

string(COMPARE EQUAL "${content_1}" "hello" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected content: ${content_1}")
endif()

string(COMPARE EQUAL "${content_2}" "boo" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected content: ${content_2}")
endif()

string(COMPARE EQUAL "${content_3}" "foo" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Unexpected content: ${content_3}")
endif()
