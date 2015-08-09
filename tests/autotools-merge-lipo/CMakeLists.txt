# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestAutotoolsMergeLipo)

function(check_files file1 file2)
  file(DIFFERENT diff FILES "${file1}" "${file2}")

  if(diff)
    message(FATAL_ERROR "Files differ: ${file1} ${file2}")
  else()
    message("Files same: ${file1} ${file2}")
  endif()
endfunction()

if(NOT CMAKE_HOST_APPLE)
  # only for platforms with lipo
  return()
endif()

set(
    script_in
    "${CMAKE_CURRENT_LIST_DIR}/../../scripts/autotools-merge-lipo.cmake.in"
)
if(NOT EXISTS "${script_in}")
  message(FATAL_ERROR "Script not found")
endif()

set(script "${CMAKE_CURRENT_BINARY_DIR}/script.cmake")

### Test 1: header

set(multi_arch_install_root "${CMAKE_CURRENT_BINARY_DIR}/root/multi")
set(ios_architectures "armv7;armv7s;arm64;i386;x86_64")
set(HUNTER_PACKAGE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/root/hunter")

foreach(arch ${ios_architectures})
  file(WRITE "${multi_arch_install_root}/${arch}/include/a.hpp" "Hello ${arch}")
endforeach()

configure_file(${script_in} ${script} @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -P ${script} RESULT_VARIABLE result)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "Script failed")
endif()

check_files(
    "${CMAKE_CURRENT_LIST_DIR}/a.hpp"
    "${HUNTER_PACKAGE_INSTALL_PREFIX}/include/a.hpp"
)

### Test 2: no header for one arch

file(REMOVE_RECURSE "${multi_arch_install_root}")
file(REMOVE_RECURSE "${HUNTER_PACKAGE_INSTALL_PREFIX}")
set(ios_architectures "armv7;armv7s;arm64;i386;x86_64")

foreach(arch ${ios_architectures})
  string(COMPARE EQUAL "${arch}" "i386" is_i386)
  if(is_i386)
    # exclude
  else()
    file(
        WRITE
        "${multi_arch_install_root}/${arch}/include/b.hpp"
        "Hello ${arch}"
    )
  endif()
endforeach()

configure_file(${script_in} ${script} @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -P ${script} RESULT_VARIABLE result)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "Script failed")
endif()

check_files(
    "${CMAKE_CURRENT_LIST_DIR}/b.hpp"
    "${HUNTER_PACKAGE_INSTALL_PREFIX}/include/b.hpp"
)
