# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

function(hunter_status_print)
  if(HUNTER_STATUS_PRINT OR HUNTER_STATUS_DEBUG)
    message(STATUS "[hunter] ${ARGV}")
  endif()
endfunction()
