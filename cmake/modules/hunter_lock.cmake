# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_try_lock)

function(hunter_lock)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")

  if(HUNTER_SKIP_LOCK)
    # Building internal project. Already locked, toolchain verified.
    hunter_status_debug("Lock skipped")
    return()
  endif()

  set(lock_file "${HUNTER_BASE}/hunter-build.lock")

  while(TRUE)
    hunter_try_lock(lock_successful)
    if(lock_successful)
      return()
    else()
      file(READ "${lock_file}" build_info)
      hunter_status_print(
          "\n"
          "Another project is using directory right now:\n\n"
          "    ${HUNTER_BASE}\n\n"
          "Build info: \n\n"
          "${build_info}\n\n"
          "If that build cancelled (interrupted by user or some other reason), "
          "please remove this file manually:\n\n"
          "    ${lock_file}\n\n"
          "Then run CMake again."
      )
      ### Lets spin
      string(TIMESTAMP time_now)
      execute_process(
          COMMAND "${CMAKE_COMMAND}" -E echo "[${time_now}] Sleep for 5 sec..."
      )
      execute_process(COMMAND "${CMAKE_COMMAND}" -E sleep 5)
    endif()
  endwhile()
endfunction()
