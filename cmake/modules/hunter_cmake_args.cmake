# Copyright (c) 2013, Ruslan Baratov
# Copyright (c) 2014, Alexander Lamaison
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)


# internal variables: _hunter_c_*
macro(hunter_cmake_args)
  set(_hunter_c_multiple_values CMAKE_ARGS)
  cmake_parse_arguments(
      _hunter_c
      ""
      ""
      "${_hunter_c_multiple_values}"
      ${ARGV}
  )
  list(LENGTH _hunter_c_UNPARSED_ARGUMENTS _hunter_c_len)
  if(NOT ${_hunter_c_len} EQUAL 1)
    hunter_fatal_error("unparsed: ${_hunter_c_UNPARSED_ARGUMENTS}")
  endif()

  list(GET _hunter_c_UNPARSED_ARGUMENTS 0 _hunter_c_current_project)

  if(_hunter_c_CMAKE_ARGS)
    list(
      # Prepend to list so already-set variables have priority
      INSERT HUNTER_${_hunter_c_current_project}_CMAKE_ARGS 0
      ${_hunter_c_CMAKE_ARGS})
  else()
    hunter_fatal_error("Expected CMAKE_ARGS")
  endif()
endmacro()
