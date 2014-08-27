# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_wiki)

function(hunter_fatal_error)
  cmake_parse_arguments(hunter "" "WIKI" "" "${ARGV}")
  if(NOT hunter_WIKI)
    hunter_internal_error("Expected wiki")
  endif()
  message("")
  foreach(x ${hunter_UNPARSED_ARGUMENTS})
    message("[hunter ** FATAL ERROR **] ${x}")
  endforeach()
  message("[hunter ** FATAL ERROR **] [Directory:${CMAKE_CURRENT_LIST_DIR}]")
  message("")
  hunter_wiki("${hunter_WIKI}")
endfunction()
