# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)

function(hunter_test_string_not_empty test_string)
  string(COMPARE EQUAL "${test_string}" "" is_empty)
  if(is_empty)
    hunter_internal_error("Unexpected empty string")
  endif()
endfunction()

# vim:set shiftwidth=2 tabstop=2 softtabstop=2 expandtab:
