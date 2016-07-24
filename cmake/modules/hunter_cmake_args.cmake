# Copyright (c) 2013, Ruslan Baratov
# Copyright (c) 2014, Alexander Lamaison
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_user_error)

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
    hunter_user_error("unparsed: ${_hunter_c_UNPARSED_ARGUMENTS}")
  endif()

  list(GET _hunter_c_UNPARSED_ARGUMENTS 0 _hunter_c_current_project)

  if(NOT _hunter_c_CMAKE_ARGS)
    hunter_user_error("Expected CMAKE_ARGS")
  endif()

  set(
      "HUNTER_${_hunter_c_current_project}_DEFAULT_CMAKE_ARGS"
      ${_hunter_c_CMAKE_ARGS}
  )
endmacro()
