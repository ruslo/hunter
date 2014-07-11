# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_test_string_not_empty)

function(hunter_try_lock result)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_LOCK_FULL_INFO}")
  hunter_test_string_not_empty("${HUNTER_LOCK_INFO}")
  hunter_test_string_not_empty("${HUNTER_LOCK_PATH}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")

  if(HUNTER_SKIP_LOCK)
    hunter_fatal_error("Internal error: HUNTER_SKIP_LOCK is set")
  endif()

  file(TO_NATIVE_PATH "${HUNTER_LOCK_PATH}" lock_path)

  # `cmake -E make_directory` is not fit here because this command succeed
  # even if directory already exists
  if(WIN32)
    execute_process(
        COMMAND cmd /C mkdir "${lock_path}"
        RESULT_VARIABLE lock_result
        OUTPUT_QUIET
        ERROR_QUIET
    )
  else()
    execute_process(
        COMMAND mkdir "${lock_path}"
        RESULT_VARIABLE lock_result
        OUTPUT_QUIET
        ERROR_QUIET
    )
  endif()

  if(NOT lock_result EQUAL 0)
    set(${result} FALSE PARENT_SCOPE)
    return()
  endif()

  file(WRITE "${HUNTER_LOCK_INFO}" "${PROJECT_BINARY_DIR}")

  string(TIMESTAMP time_now)
  file(
      WRITE
      "${HUNTER_LOCK_FULL_INFO}"
      "    Project binary directory: ${PROJECT_BINARY_DIR}\n"
      "    Package name: ${HUNTER_PACKAGE_NAME}\n"
      "    Install tag: ${HUNTER_INSTALL_TAG}\n"
      "    Build start at: ${time_now}"
  )

  set(${result} TRUE PARENT_SCOPE)
endfunction()
