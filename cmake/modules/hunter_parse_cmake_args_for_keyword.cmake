# Copyright (c) 2017, NeroBurner
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_parse_cmake_args_for_keyword)
  set(optional "")
  set(one KEYWORD OUTPUT)
  set(multiple CMAKE_ARGS)

  # Introduce:
  # * x_CMAKE_ARGS
  # * x_KEYWORD
  # * x_OUTPUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_KEYWORD}" "" is_empty)
  if(is_empty)
    hunter_internal_error("KEYWORD is empty")
  endif()
  string(COMPARE EQUAL "${x_OUTPUT}" "" is_empty)
  if(is_empty)
    hunter_internal_error("OUTPUT is empty")
  endif()

  # get KEYWORD from CMAKE_ARGS
  set(output)
  foreach(entry ${x_CMAKE_ARGS})
    string(FIND "${entry}" "=" update_var)
    if(update_var EQUAL -1)
      # nothing to to
    else()
      # Format <name>=<value>
      # Note that we can have more than one '=' sign, e.g. A=-opt=value1
      string(REGEX REPLACE "=.*" "" var_name "${entry}")

      # 'string(REGEX REPLACE' will replace as much patterns as it found so
      # it's not possible to replace only one '=' as we need.
      string(LENGTH "${var_name}" var_name_len)
      math(EXPR value_begin "${var_name_len} + 1")
      string(SUBSTRING "${entry}" "${value_begin}" -1 var_value)

      # Check for submodule-source-dir keyword
      string(COMPARE EQUAL "${var_name}" "${x_KEYWORD}" is_keyword)
      if(is_keyword)
        hunter_status_debug("Found ${var_name} = '${var_value}'")
        set(output "${var_value}")
      endif()
    endif()
  endforeach()

  # set OUTPUT variable
  set("${x_OUTPUT}" "${output}" PARENT_SCOPE)
endfunction()

