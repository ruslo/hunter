# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

function(hunter_status_print)
  if(HUNTER_STATUS_PRINT OR HUNTER_STATUS_DEBUG)
    if(HUNTER_CACHE_RUN)
      hunter_status_debug("${ARGV}")
    else()
      message(STATUS "[hunter] ${ARGV}")
    endif()
  endif()
endfunction()

# vim:set shiftwidth=2 tabstop=2 softtabstop=2 expandtab:
