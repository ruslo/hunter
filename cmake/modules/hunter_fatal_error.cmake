# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

function(hunter_fatal_error)
  if(${ARGC} EQUAL 0)
    message(FATAL_ERROR "unexpected number of arguments")
  endif()
  foreach(print_message ${ARGV})
    message("")
    message("[hunter] ${print_message}")
    message("")
  endforeach()
  message("directory: ${CMAKE_CURRENT_LIST_DIR}")
  message(FATAL_ERROR "")
endfunction()
