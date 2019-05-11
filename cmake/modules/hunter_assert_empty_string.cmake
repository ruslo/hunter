# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)

function(hunter_assert_empty_string string_to_check)
  if(NOT ARGN STREQUAL "")
    hunter_internal_error("Unexpected: '${ARGN}'")
  endif()

  if(NOT string_to_check STREQUAL "")
    hunter_internal_error("Expected to be empty: '${string_to_check}'")
  endif()
endfunction()
