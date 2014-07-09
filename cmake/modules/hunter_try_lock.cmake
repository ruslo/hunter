# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_test_string_not_empty)

function(hunter_try_lock result)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")

  set(lock_file "${HUNTER_BASE}/hunter-build.lock")

  if(HUNTER_SKIP_LOCK)
    hunter_fatal_error("Internal error: HUNTER_SKIP_LOCK is set")
  endif()

  string(TIMESTAMP time_now)
  set(
      lock_info_written
      "    Project binary directory: ${PROJECT_BINARY_DIR}\n"
      "    Package name: ${HUNTER_PACKAGE_NAME}\n"
      "    Install tag: ${HUNTER_INSTALL_TAG}\n"
      "    Build start at: ${time_now}"
  )

  if(EXISTS "${lock_file}")
    set(${result} FALSE PARENT_SCOPE)
    return()
  endif()

  file(WRITE "${lock_file}" "${lock_info_written}")

  # Hope this helps (:
  execute_process(COMMAND "${CMAKE_COMMAND}" -E sleep 2)

  file(READ "${lock_file}" lock_info_read)
  string(COMPARE EQUAL "${lock_info_written}" "${lock_info_read}" locked_by_us)

  if(locked_by_us)
    set(${result} TRUE PARENT_SCOPE)
    return()
  else()
    set(${result} FALSE PARENT_SCOPE)
    return()
  endif()
endfunction()
