# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)

function(hunter_check_download_error_message error_code error_message)
  set(expected_message "")

  if(error_code EQUAL 0)
    set(expected_message "\"No error\"")
  elseif(error_code EQUAL 22)
    set(expected_message "\"HTTP response code said error\"")
  elseif(error_code EQUAL 6)
    set(expected_message "\"Couldn't resolve host name\"")
  elseif(error_code EQUAL 56)
    set(expected_message "\"Failure when receiving data from the peer\"")
  else()
    hunter_internal_error(
        "Unknown error\n  code: ${error_code}\n  message: ${error_message}"
    )
  endif()

  string(COMPARE EQUAL "${error_message}" "${expected_message}" is_good)

  if(NOT is_good)
    hunter_internal_error(
        "Unexpected error message for code ${error_code}: ${error_message}"
    )
  endif()
endfunction()
