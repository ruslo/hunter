# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)
include(hunter_get_temp_directory)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_set_cmake_default_generator)
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")

  set(
      generator_info
      "${HUNTER_BASE}/Toolchains/${HUNTER_INSTALL_TAG}/default_generator.info"
  )

  if(EXISTS "${generator_info}")
    hunter_status_debug("File `${generator_info}` exists")
    return()
  endif()

  hunter_status_debug("File `${generator_info}` not found, run test...")

  hunter_get_temp_directory(
      "${PROJECT_BINARY_DIR}/_3rdParty/hunter/generator-info"
      temp_project_dir
  )
  hunter_test_string_not_empty("${temp_project_dir}")
  set(temp_build_dir "${temp_project_dir}/_builds")

  file(
      WRITE
      "${temp_project_dir}/CMakeLists.txt"
      "cmake_minimum_required(VERSION 3.0)\n"
      "project(temp)\n"
      "file(\n"
      "    WRITE\n"
      "    \"${generator_info}\"\n"
      "    \"\${CMAKE_GENERATOR}\"\n"
      ")\n"
  )

  execute_process(
      COMMAND
      "${CMAKE_COMMAND}"
      "-H${temp_project_dir}"
      "-B${temp_build_dir}"
      RESULT_VARIABLE
      generate_result
  )

  if(NOT generate_result EQUAL "0")
    hunter_fatal_error("Generate failed: exit with code ${generate_result}")
  endif()

  if(NOT EXISTS "${generator_info}")
    hunter_fatal_error("Internal error `${generator_info}` not exists")
  endif()

  file(REMOVE_RECURSE "${temp_project_dir}")
endfunction()
