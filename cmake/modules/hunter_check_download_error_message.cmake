# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_user_error)

function(hunter_check_download_error_message)
  set(one ERROR_CODE ERROR_MESSAGE REMOVE_ON_ERROR NOT_FOUND_COUNTER)
  cmake_parse_arguments(x "" "${one}" "" "${ARGV}")
  # x_ERROR_CODE
  # x_ERROR_MESSAGE
  # x_REMOVE_ON_ERROR
  # x_NOT_FOUND_COUNTER
  # x_UNPARSED_ARGUMENTS

  hunter_test_string_not_empty("${x_ERROR_CODE}")
  hunter_test_string_not_empty("${x_ERROR_MESSAGE}")
  hunter_test_string_not_empty("${x_REMOVE_ON_ERROR}")
  hunter_test_string_not_empty("${x_NOT_FOUND_COUNTER}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  set(expected_message "")

  if(x_ERROR_CODE EQUAL 0)
    set(expected_message "\"No error\"")
  elseif(x_ERROR_CODE EQUAL 22)
    set(expected_message "\"HTTP response code said error\"")
  elseif(x_ERROR_CODE EQUAL 6)
    set(expected_message "\"Couldn't resolve host name\"")
    string(COMPARE EQUAL "${HUNTER_USE_CACHE_SERVERS}" "ONLY" only_server)
    if(only_server)
      file(REMOVE "${x_REMOVE_ON_ERROR}")
      hunter_user_error(
          "HUNTER_USE_CACHE_SERVERS is set to ONLY but network is down."
      )
    endif()
  elseif(x_ERROR_CODE EQUAL 56)
    set(expected_message "\"Failure when receiving data from the peer\"")
  elseif(x_ERROR_CODE EQUAL 18)
    set(expected_message "\"Transferred a partial file\"")
  elseif(x_ERROR_CODE EQUAL 35)
    set(expected_message "\"SSL connect error\"")
  elseif(x_ERROR_CODE EQUAL 7)
    set(expected_message "\"Couldn't connect to server\"")
  elseif(x_ERROR_CODE EQUAL 28)
    set(expected_message "\"Timeout was reached\"")
  elseif(x_ERROR_CODE EQUAL 1)
    set(expected_message "\"Unsupported protocol\"")
  elseif(x_ERROR_CODE EQUAL 52)
    set(expected_message "\"Server returned nothing (no headers, no data)\"")
  else()
    file(REMOVE "${x_REMOVE_ON_ERROR}")
    hunter_internal_error(
        "Unknown error\n  code: ${x_ERROR_CODE}\n  message: ${x_ERROR_MESSAGE}"
    )
  endif()

  if(NOT x_ERROR_CODE EQUAL 0)
    file(REMOVE "${x_REMOVE_ON_ERROR}")
  endif()

  string(COMPARE EQUAL "${x_ERROR_MESSAGE}" "${expected_message}" is_good)

  if(NOT is_good)
    file(REMOVE "${x_REMOVE_ON_ERROR}")
    hunter_internal_error(
        "Unexpected error message for code ${x_ERROR_CODE}: ${x_ERROR_MESSAGE}"
    )
  endif()

  # iterate NOT_FOUND_COUNTER:
  # we expect series of N errors with 22 code; in case error is not 22, start
  # again - zero counter
  if(x_ERROR_CODE EQUAL 22)
    set(i "${${x_NOT_FOUND_COUNTER}}")
    math(EXPR i "${i} + 1")
  else()
    set(i 0)
  endif()
  set("${x_NOT_FOUND_COUNTER}" "${i}" PARENT_SCOPE)
endfunction()
