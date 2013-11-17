# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

function(hunter_status_print)
  foreach(print_message ${ARGV})
    if(HUNTER_STATUS_PRINT OR HUNTER_STATUS_DEBUG)
      message(STATUS "[hunter] ${print_message}")
    endif()
  endforeach()
endfunction()
