# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_verify_toolchain_info)

function(hunter_lock)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_ROOT}")
  hunter_test_string_not_empty("${PROJECT_BINARY_DIR}")

  if(HUNTER_SKIP_LOCK)
    # Building internal project. Already locked, toolchain verified.
    hunter_status_debug("Lock skipped")
    return()
  endif()

  hunter_status_debug("lock directory")

  set(lock_file "${HUNTER_ROOT}/Base/hunter-build.lock")
  set(binary_dir_file "${HUNTER_ROOT}/Base/binary-dir.lock")

  if(EXISTS "${lock_file}")
    if(NOT EXISTS "${binary_dir_file}")
      hunter_fatal_error("Lock file exists but `${binary_dir_file}` not found")
    endif()
    file(READ "${binary_dir_file}" locked_binary_dir)
    if(EXISTS "${locked_binary_dir}")
      # directory still exists and may be active
      file(READ "${lock_file}" build_info)
      message(
        "\n"
        "Another project is using directory right now:\n\n"
        "    ${HUNTER_ROOT}\n\n"
        "Build info: \n\n"
        "${build_info}\n\n"
        "If that build cancelled (interrupted by user or some other reason), "
        "please remove this file manually:\n\n"
        "    ${lock_file}\n\n"
        "Then run CMake again."
      )
      hunter_fatal_error("Directory busy")
    endif()
  endif()

  string(TIMESTAMP time_now)

  file(
      WRITE
      "${lock_file}"
      "    Project binary directory: ${PROJECT_BINARY_DIR}\n"
      "    Package name: ${HUNTER_PACKAGE_NAME}\n"
      "    Install tag: ${HUNTER_INSTALL_TAG}\n"
      "    Build start at: ${time_now}"
  )

  file(WRITE "${binary_dir_file}" "${PROJECT_BINARY_DIR}")

  hunter_verify_toolchain_info()
endfunction()
