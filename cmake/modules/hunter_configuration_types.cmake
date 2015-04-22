# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_user_error)

macro(hunter_configuration_types)
  set(_hunter_multiple_values CONFIGURATION_TYPES)
  cmake_parse_arguments(
      _hunter
      ""
      ""
      "${_hunter_multiple_values}"
      ${ARGV}
  )
  list(LENGTH _hunter_UNPARSED_ARGUMENTS _hunter_len)
  if(NOT ${_hunter_len} EQUAL 1)
    hunter_user_error("unparsed: ${_hunter_UNPARSED_ARGUMENTS}")
  endif()

  list(GET _hunter_UNPARSED_ARGUMENTS 0 _hunter_current_project)

  # Set value only if not defined in 'config.cmake',
  # i.e. when *_CONFIGURATIONS_TYPES is empty
  string(
      COMPARE
      EQUAL
      "${HUNTER_${_hunter_current_project}_CONFIGURATION_TYPES}"
      ""
      _hunter_is_empty
  )

  if(_hunter_is_empty)
    set(
        "HUNTER_${_hunter_current_project}_CONFIGURATION_TYPES"
        ${_hunter_CONFIGURATION_TYPES}
    )
  endif()
endmacro()
