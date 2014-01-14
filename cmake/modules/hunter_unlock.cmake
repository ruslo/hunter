# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)
include(hunter_test_string_not_empty)

function(hunter_unlock)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_ROOT}")

  if(HUNTER_SKIP_LOCK)
    hunter_status_debug("Unlock skipped")
    return()
  endif()

  set(lock_file "${HUNTER_ROOT}/Base/hunter-build.lock")
  if(NOT EXISTS "${lock_file}")
    hunter_fatal_error("Internal error: lock file `${lock_file}` not exists")
  endif()

  file(REMOVE "${lock_file}")
endfunction()
