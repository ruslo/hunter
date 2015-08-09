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

### Test 3: fuse libraries

file(REMOVE_RECURSE "${multi_arch_install_root}")
file(REMOVE_RECURSE "${HUNTER_PACKAGE_INSTALL_PREFIX}")
set(ios_architectures "armv7;armv7s;arm64;i386;x86_64")

foreach(arch ${ios_architectures})
  file(MAKE_DIRECTORY "${multi_arch_install_root}/${arch}/lib")
  execute_process(
      COMMAND
      /usr/bin/clang++
      -arch
      "${arch}"
      "${CMAKE_CURRENT_LIST_DIR}/a.cpp"
      -o
      "${multi_arch_install_root}/${arch}/lib/libA.a"
      -c
      RESULT_VARIABLE
      result
      OUTPUT_VARIABLE
      output
      ERROR_VARIABLE
      output
  )
  if(NOT result EQUAL 0)
    message(FATAL_ERROR "clang++ failed (${result}): ${output}")
  endif()
endforeach()

configure_file(${script_in} ${script} @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -P ${script} RESULT_VARIABLE result)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "Script failed")
endif()

set(universal_lib "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/libA.a")
if(NOT EXISTS "${universal_lib}")
  message(FATAL_ERROR "Not exists: ${universal_lib}")
endif()

execute_process(
    COMMAND lipo -info "${universal_lib}"
    RESULT_VARIABLE result
    OUTPUT_VARIABLE output
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "lipo failed")
endif()
string(
    REGEX
    MATCH
    "^Architectures in the fat file: .* are: i386 x86_64 armv7 armv7s arm64$"
    result
    "${output}"
)
string(COMPARE EQUAL "${result}" "${output}" regex_match)
if(NOT regex_match)
  message(FATAL_ERROR "Unexpected lipo output:\n  ${output}\n  ${result}")
endif()

### Test 4: armv7 library missed (error: files left)

file(REMOVE_RECURSE "${multi_arch_install_root}")
file(REMOVE_RECURSE "${HUNTER_PACKAGE_INSTALL_PREFIX}")
set(ios_architectures "armv7;armv7s;arm64;i386;x86_64")

foreach(arch ${ios_architectures})
  if(NOT arch STREQUAL "armv7")
    file(MAKE_DIRECTORY "${multi_arch_install_root}/${arch}/lib")
    execute_process(
        COMMAND
        /usr/bin/clang++
        -arch
        "${arch}"
        "${CMAKE_CURRENT_LIST_DIR}/a.cpp"
        -o
        "${multi_arch_install_root}/${arch}/lib/libA.a"
        -c
        RESULT_VARIABLE
        result
        OUTPUT_VARIABLE
        output
        ERROR_VARIABLE
        output
    )
    if(NOT result EQUAL 0)
      message(FATAL_ERROR "clang++ failed (${result}): ${output}")
    endif()
  endif()
endforeach()

configure_file(${script_in} ${script} @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -P ${script} RESULT_VARIABLE result)
if(result EQUAL 0)
  message(FATAL_ERROR "Script should fail!")
endif()

### Test 5: i386 library missed (error: lipo failed)

file(REMOVE_RECURSE "${multi_arch_install_root}")
file(REMOVE_RECURSE "${HUNTER_PACKAGE_INSTALL_PREFIX}")
set(ios_architectures "armv7;armv7s;arm64;i386;x86_64")

foreach(arch ${ios_architectures})
  if(NOT arch STREQUAL "i386")
    file(MAKE_DIRECTORY "${multi_arch_install_root}/${arch}/lib")
    execute_process(
        COMMAND
        /usr/bin/clang++
        -arch
        "${arch}"
        "${CMAKE_CURRENT_LIST_DIR}/a.cpp"
        -o
        "${multi_arch_install_root}/${arch}/lib/libA.a"
        -c
        RESULT_VARIABLE
        result
        OUTPUT_VARIABLE
        output
        ERROR_VARIABLE
        output
    )
    if(NOT result EQUAL 0)
      message(FATAL_ERROR "clang++ failed (${result}): ${output}")
    endif()
  endif()
endforeach()

configure_file(${script_in} ${script} @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -P ${script} RESULT_VARIABLE result)
if(result EQUAL 0)
  message(FATAL_ERROR "Script should fail!")
endif()

### Test 5: fuse bin folder

file(REMOVE_RECURSE "${multi_arch_install_root}")
file(REMOVE_RECURSE "${HUNTER_PACKAGE_INSTALL_PREFIX}")
set(ios_architectures "armv7;armv7s;arm64;i386;x86_64")

foreach(arch ${ios_architectures})
  file(MAKE_DIRECTORY "${multi_arch_install_root}/${arch}/bin")
  execute_process(
      COMMAND
      /usr/bin/clang++
      -arch
      "${arch}"
      "${CMAKE_CURRENT_LIST_DIR}/a.cpp"
      -o
      "${multi_arch_install_root}/${arch}/bin/A"
      -c
      RESULT_VARIABLE
      result
      OUTPUT_VARIABLE
      output
      ERROR_VARIABLE
      output
  )
  if(NOT result EQUAL 0)
    message(FATAL_ERROR "clang++ failed (${result}): ${output}")
  endif()
endforeach()

configure_file(${script_in} ${script} @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -P ${script} RESULT_VARIABLE result)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "Script failed")
endif()

set(universal_bin "${HUNTER_PACKAGE_INSTALL_PREFIX}/bin/A")
if(NOT EXISTS "${universal_bin}")
  message(FATAL_ERROR "Not exists: ${universal_bin}")
endif()

execute_process(
    COMMAND lipo -info "${universal_bin}"
    RESULT_VARIABLE result
    OUTPUT_VARIABLE output
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "lipo failed")
endif()
string(
    REGEX
    MATCH
    "^Architectures in the fat file: .* are: i386 x86_64 armv7 armv7s arm64$"
    result
    "${output}"
)
string(COMPARE EQUAL "${result}" "${output}" regex_match)
if(NOT regex_match)
  message(FATAL_ERROR "Unexpected lipo output:\n  ${output}\n  ${result}")
endif()
