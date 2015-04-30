# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterPackDirectory)

include(hunter_pack_directory)

set(temp "${CMAKE_CURRENT_BINARY_DIR}/temp")

set(dir_to_pack "${temp}/topack")

file(WRITE "${dir_to_pack}/1.txt" "hello")
file(WRITE "${dir_to_pack}/B/2.txt" "boo")
file(WRITE "${dir_to_pack}/B/C/3.txt" "foo")

set(dest_dir "${temp}/dest")

hunter_pack_directory("${dir_to_pack}" "${dest_dir}" result_sha1)

string(COMPARE EQUAL "${result_sha1}" "" is_bad)
if(is_bad)
  message(FATAL_ERROR "result_sha1 is empty")
endif()

set(file_path "${dest_dir}/${result_sha1}.tar.bz2")
if(NOT EXISTS "${file_path}")
  message(FATAL_ERROR "archive not found")
endif()

file(SHA1 "${file_path}" checked_sha1)
string(COMPARE EQUAL "${result_sha1}" "${checked_sha1}" is_good)
if(NOT is_good)
  message(FATAL_ERROR "SHA1 mismatch")
endif()
