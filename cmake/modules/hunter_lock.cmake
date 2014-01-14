# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)
include(hunter_test_string_not_empty)

function(hunter_lock)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_ROOT}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")

  set(lock_file "${HUNTER_ROOT}/Base/hunter-build.lock")
  if(EXISTS "${lock_file}")
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

  string(TIMESTAMP time_now)

  file(
      WRITE
      "${lock_file}"
      "    Project binary directory: ${PROJECT_BINARY_DIR}\n"
      "    Package name: ${HUNTER_PACKAGE_NAME}\n"
      "    Install tag: ${HUNTER_INSTALL_TAG}\n"
      "    Build start at: ${time_now}"
  )
endfunction()
