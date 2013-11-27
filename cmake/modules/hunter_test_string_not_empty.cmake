# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)

function(hunter_test_string_not_empty test_string)
  if(NOT test_string)
    hunter_fatal_error("Unexpected empty string")
  endif()
endfunction()
