# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_wiki)

function(hunter_internal_error)
  message("")
  foreach(print_message ${ARGV})
    message("[hunter ** INTERNAL **] ${print_message}")
  endforeach()
  message("[hunter ** INTERNAL **] [Directory:${CMAKE_CURRENT_LIST_DIR}]")
  message("")
  hunter_wiki("error.internal")
endfunction()
