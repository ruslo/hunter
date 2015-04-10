# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

function(hunter_status_debug)
  if(HUNTER_STATUS_DEBUG)
    string(TIMESTAMP timestamp)
    message(STATUS "[hunter *** DEBUG *** ${timestamp}] ${ARGV}")
  endif()
endfunction()
