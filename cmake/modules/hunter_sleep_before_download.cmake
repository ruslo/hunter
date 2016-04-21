# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_sleep_before_download attempt)
  hunter_test_string_not_empty("${attempt}")

  if(attempt EQUAL 0)
    return()
  endif()

  if(attempt EQUAL 1)
    return()
  endif()

  set(sleep_seconds 0)

  if(attempt EQUAL 2)
    set(sleep_seconds 5)
  elseif(attempt EQUAL 3)
    set(sleep_seconds 5)
  elseif(attempt EQUAL 4)
    set(sleep_seconds 15)
  elseif(attempt EQUAL 5)
    set(sleep_seconds 60)
  elseif(attempt EQUAL 6)
    set(sleep_seconds 90)
  elseif(attempt EQUAL 7)
    set(sleep_seconds 300)
  else()
    set(sleep_seconds 1200)
  endif()

  hunter_status_debug(
      "Retry after ${sleep_seconds} seconds (attempt #${attempt}) ..."
  )

  execute_process(
      COMMAND "${CMAKE_COMMAND}" -E sleep "${sleep_seconds}" RESULT_VARIABLE x
  )
  if(NOT x EQUAL 0)
    hunter_internal_error("Sleep failed: ${x}")
  endif()
endfunction()
