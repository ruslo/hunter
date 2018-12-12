# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-LLVM)

# DOCUMENTATION_START {
hunter_add_package(LLVM)
find_package(LLVM CONFIG REQUIRED)

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
llvm_map_components_to_libnames(llvm_libs support core)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC ${llvm_libs})
# DOCUMENTATION_END }

if(NOT TARGET llvm-ar)
  message(FATAL_ERROR "llvm-ar target not exists")
endif()
get_target_property(llvm_ar_path llvm-ar IMPORTED_LOCATION_RELEASE)
execute_process(
    COMMAND ${llvm_ar_path} --version
    RESULT_VARIABLE result
    OUTPUT_VARIABLE output
    ERROR_VARIABLE output
)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "Command failed (${result}, ${output})")
endif()
message("llvm-ar info (${llvm_ar_path}):\n${output}")

unset(clang_path CACHE)
find_program(clang_path clang++ HINTS "${LLVM_ROOT}/bin")
execute_process(
    COMMAND ${clang_path} --version
    RESULT_VARIABLE result
    OUTPUT_VARIABLE output
    ERROR_VARIABLE output
)
if(NOT result EQUAL 0)
  message(FATAL_ERROR "Command failed (${result}, ${output})")
endif()
message("clang++ info (${clang_path}):\n${output}")
