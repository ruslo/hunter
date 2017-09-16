# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_wiki)

function(hunter_fatal_error)
  cmake_parse_arguments(x "" "WIKI" "" "${ARGV}")
  if(NOT x_WIKI)
    hunter_internal_error("Expected argument WIKI")
  endif()
  message("")
  foreach(x ${x_UNPARSED_ARGUMENTS})
    message("[hunter ** FATAL ERROR **] ${x}")
  endforeach()
  message("[hunter ** FATAL ERROR **] [Directory:${CMAKE_CURRENT_LIST_DIR}]")
  message("")
  hunter_wiki("${x_WIKI}")
endfunction()
