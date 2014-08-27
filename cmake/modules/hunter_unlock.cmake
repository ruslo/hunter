# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_test_string_not_empty)

function(hunter_unlock)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${HUNTER_LOCK_PATH}")

  if(HUNTER_SKIP_LOCK)
    hunter_status_debug("Unlock skipped")
    return()
  endif()

  if(NOT EXISTS "${HUNTER_LOCK_PATH}")
    hunter_internal_error("Lock `${HUNTER_LOCK_PATH}` not exists")
  endif()

  file(REMOVE_RECURSE "${HUNTER_LOCK_PATH}")
  hunter_status_debug("Unlock: ${HUNTER_LOCK_PATH}")
endfunction()
