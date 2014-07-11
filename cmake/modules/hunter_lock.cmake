# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_try_lock)

function(hunter_lock)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_LOCK_PATH}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")

  if(HUNTER_SKIP_LOCK)
    # Building internal project. Already locked, toolchain verified.
    hunter_status_debug("Lock skipped")
    return()
  endif()

  set(HUNTER_LOCK_INFO "${HUNTER_LOCK_PATH}/info")
  set(HUNTER_LOCK_FULL_INFO "${HUNTER_LOCK_PATH}/fullinfo")

  while(TRUE)
    hunter_try_lock(lock_successful)
    if(lock_successful)
      hunter_status_debug("Lock: ${HUNTER_LOCK_PATH}")
      return()
    endif()
    if(EXISTS "${HUNTER_LOCK_FULL_INFO}")
      file(READ "${HUNTER_LOCK_FULL_INFO}" fullinfo)
    else()
      set(fullinfo "????")
    endif()
    hunter_status_print(
        "\n"
        "Another project is using directory right now:\n\n"
        "    ${HUNTER_BASE}\n\n"
        "Build info:\n\n"
        "  ${fullinfo}\n\n"
        "If that build cancelled (interrupted by user or some other reason), "
        "please remove this directory manually:\n\n"
        "    ${HUNTER_LOCK_PATH}\n\n"
        "then run CMake again."
    )
    if(EXISTS "${HUNTER_LOCK_INFO}")
      # Read file with binary directory path and check sanity
      file(READ "${HUNTER_LOCK_INFO}" info)
      string(COMPARE EQUAL "${info}" "${PROJECT_BINARY_DIR}" incorrect)
      if(incorrect)
        hunter_fatal_error("Waiting for self directory")
      endif()
      if(NOT EXISTS "${info}")
        # Do not crash here, this may happens (checking/reading is not atomic)
        hunter_status_debug("Waiting for deleted directory!")
      endif()
    endif()
    ### Lets spin
    string(TIMESTAMP time_now)
    execute_process(
        COMMAND "${CMAKE_COMMAND}" -E echo "[${time_now}] Sleep for 5 sec..."
    )
    execute_process(COMMAND "${CMAKE_COMMAND}" -E sleep 5)
  endwhile()
endfunction()
