# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_status_debug)
include(hunter_test_string_not_empty)

# lock directory for current function
macro(hunter_lock)
  # sanity check
  hunter_test_string_not_empty("${HUNTER_BASE}")

  if(HUNTER_SKIP_LOCK)
    # Building internal project. Already locked, toolchain verified.
    hunter_status_debug("Lock skipped")
  else()
    file(LOCK "${HUNTER_BASE}" DIRECTORY GUARD FUNCTION)
  endif()
endmacro()
