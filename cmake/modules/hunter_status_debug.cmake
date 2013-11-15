# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

function(hunter_status_debug)
  foreach(print_message ${ARGV})
    if(HUNTER_STATUS_DEBUG)
      message(STATUS "[hunter *** DEBUG ***] ${print_message}")
    endif()
  endforeach()
endfunction()
