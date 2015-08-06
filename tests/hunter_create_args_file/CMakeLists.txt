# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterCreateArgsFile)

include(hunter_create_args_file)

function(check_files file1 file2)
  file(DIFFERENT diff FILES "${file1}" "${file2}")

  if(diff)
    message(FATAL_ERROR "Files differ: ${file1} ${file2}")
  else()
    message("Files same: ${file1} ${file2}")
  endif()
endfunction()

set(test_1_etalon "${CMAKE_CURRENT_LIST_DIR}/test_1")
set(test_2_etalon "${CMAKE_CURRENT_LIST_DIR}/test_2")
set(test_3_etalon "${CMAKE_CURRENT_LIST_DIR}/test_3")
set(test_4_etalon "${CMAKE_CURRENT_LIST_DIR}/test_4")
set(test_5_etalon "${CMAKE_CURRENT_LIST_DIR}/test_5")
set(test_6_etalon "${CMAKE_CURRENT_LIST_DIR}/test_6")
set(test_7_etalon "${CMAKE_CURRENT_LIST_DIR}/test_7")
set(test_8_etalon "${CMAKE_CURRENT_LIST_DIR}/test_8")
set(test_9_etalon "${CMAKE_CURRENT_LIST_DIR}/test_9")
set(test_10_etalon "${CMAKE_CURRENT_LIST_DIR}/test_10")

set(test_1 "${CMAKE_CURRENT_BINARY_DIR}/test_1")
set(test_2 "${CMAKE_CURRENT_BINARY_DIR}/test_2")
set(test_3 "${CMAKE_CURRENT_BINARY_DIR}/test_3")
set(test_4 "${CMAKE_CURRENT_BINARY_DIR}/test_4")
set(test_5 "${CMAKE_CURRENT_BINARY_DIR}/test_5")
set(test_6 "${CMAKE_CURRENT_BINARY_DIR}/test_6")
set(test_7 "${CMAKE_CURRENT_BINARY_DIR}/test_7")
set(test_8 "${CMAKE_CURRENT_BINARY_DIR}/test_8")
set(test_9 "${CMAKE_CURRENT_BINARY_DIR}/test_9")
set(test_10 "${CMAKE_CURRENT_BINARY_DIR}/test_10")

hunter_create_args_file("A=value1" "${test_1}")
hunter_create_args_file("A=value1 value2" "${test_2}")
hunter_create_args_file("A=value1;B=value2" "${test_3}")
hunter_create_args_file("A=value1;value2" "${test_4}")
hunter_create_args_file("A=value1;B:BOOL=value2" "${test_5}")
hunter_create_args_file("A=value1;B:BOOL=value2;value3;C=value4" "${test_6}")
hunter_create_args_file("A=value1;value2;value3;value4" "${test_7}")
hunter_create_args_file("" "${test_8}")
hunter_create_args_file(
    "A=value1;B:BOOL=value2;value3;C=-opt=value4;D=value5"
    "${test_9}"
)
hunter_create_args_file(
    "A=value1;B:BOOL=value2;value3;C=-opt1=value4 -opt2=value5;D=value6"
    "${test_10}"
)

check_files("${test_1_etalon}" "${test_1}")
check_files("${test_2_etalon}" "${test_2}")
check_files("${test_3_etalon}" "${test_3}")
check_files("${test_4_etalon}" "${test_4}")
check_files("${test_5_etalon}" "${test_5}")
check_files("${test_6_etalon}" "${test_6}")
check_files("${test_7_etalon}" "${test_7}")
check_files("${test_8_etalon}" "${test_8}")
check_files("${test_9_etalon}" "${test_9}")
check_files("${test_10_etalon}" "${test_10}")
