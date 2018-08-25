# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)

function(hunter_assert_not_empty_string test_string)
  string(COMPARE EQUAL "${test_string}" "" is_empty)
  if(is_empty)
    hunter_internal_error("Unexpected empty string")
  endif()
endfunction()
