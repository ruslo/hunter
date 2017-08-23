# Copyright (c) 2017 NeroBurner
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_test_string_not_empty)

function(hunter_get_boost_libs)
  set(function_name "hunter_get_boost_libs")
  set(function_synopsis "${function_name}(VERSION requested_boost_version LIBS found_libs)")

  # parse arguments
  set(one_value_args VERSION LIBS)
  cmake_parse_arguments(x "" "${one_value_args}" "" ${ARGV})

  # No free arguments allowed
  list(LENGTH x_UNPARSED_ARGUMENTS x_len)
  if(NOT x_len EQUAL 0)
    hunter_internal_error(
      "'${function_name}' incorrect usage,"
      " expected no free arguments '${x_UNPARSED_ARGUMENTS}'."
      " Synopsis: ${function_synopsis}"
    )
  endif()

  # check mandatory arguments
  foreach(arg VERSION LIBS)
    string(COMPARE EQUAL "${x_${arg}}" "" is_empty)
    if(is_empty)
      hunter_internal_error(
        "'${function_name}' incorrect usage,"
        " option '${arg}' with one argument is mandatory."
        " Synopsis: ${function_synopsis}"
      )
    endif()

    string(FIND "${x_${arg}}" " " arg_whitespace_position)
    if(NOT arg_whitespace_position EQUAL -1)
      hunter_internal_error(
        "'${function_name}' incorrect usage,"
        " argument '${arg}' with whitespaces not allowed."
        " offending value '${x_${arg}}'"
      )
    endif()
  endforeach()

  # check boost component valid version range, add to 'boost_libs' if valid
  # - version_since: first boost version the component is included
  # - version_until: first boost version the component isn't included anymore
  macro(boost_component)
    # parse arguments
    set(_one_value_args COMPONENT SINCE UNTIL)
    cmake_parse_arguments(_y "" "${_one_value_args}" "" ${ARGV})

    foreach(_arg COMPONENT SINCE)
      string(COMPARE EQUAL "${_y_${_arg}}" "" _is_empty)
      if(_is_empty)
        hunter_internal_error(
          "'boost_component' incorrect usage,"
          " option '${_arg}' with one argument is mandatory."
          " Synopsis: boost_component(COMPONENT name SINCE version_since [UNTIL version_until])"
        )
      endif()
    endforeach()

    if(NOT x_VERSION VERSION_LESS _y_SINCE)
      # check until only if set
      string(COMPARE EQUAL "${_y_UNTIL}" "" _is_empty)
      if(_is_empty)
        list(APPEND boost_libs ${_y_COMPONENT})
      elseif(x_VERSION VERSION_LESS _y_UNTIL)
        list(APPEND boost_libs ${_y_COMPONENT})
      endif()
    endif()
  endmacro()

  # list of all boost components valid for given version
  set(boost_libs)
  boost_component(COMPONENT atomic          SINCE 1.53.0)
  boost_component(COMPONENT chrono          SINCE 1.47.0)
  boost_component(COMPONENT container       SINCE 1.56.0)
  boost_component(COMPONENT context         SINCE 1.51.0)
  boost_component(COMPONENT coroutine       SINCE 1.53.0)
  boost_component(COMPONENT coroutine2      SINCE 1.60.0  UNTIL 1.65.0)
  boost_component(COMPONENT date_time       SINCE 1.29.0)
  boost_component(COMPONENT exception       SINCE 1.36.0)
  boost_component(COMPONENT fiber           SINCE 1.62.0)
  boost_component(COMPONENT filesystem      SINCE 1.30.0)
  boost_component(COMPONENT graph           SINCE 1.18.0)
  boost_component(COMPONENT graph_parallel  SINCE 1.18.0)
  boost_component(COMPONENT iostreams       SINCE 1.33.0)
  boost_component(COMPONENT locale          SINCE 1.48.0)
  boost_component(COMPONENT log             SINCE 1.54.0)
  boost_component(COMPONENT math            SINCE 1.23.0)
  boost_component(COMPONENT metaparse       SINCE 1.61.0)
  boost_component(COMPONENT mpi             SINCE 1.35.0)
  boost_component(COMPONENT program_options SINCE 1.32.0)
  boost_component(COMPONENT python          SINCE 1.19.0)
  boost_component(COMPONENT random          SINCE 1.15.0)
  boost_component(COMPONENT regex           SINCE 1.18.0)
  boost_component(COMPONENT serialization   SINCE 1.32.0)
  boost_component(COMPONENT signals         SINCE 1.29.0)
  boost_component(COMPONENT stacktrace      SINCE 1.65.0)
  boost_component(COMPONENT system          SINCE 1.35.0)
  boost_component(COMPONENT test            SINCE 1.21.0)
  boost_component(COMPONENT thread          SINCE 1.25.0)
  boost_component(COMPONENT timer           SINCE 1.9.0)
  boost_component(COMPONENT type_erasure    SINCE 1.60.0)
  boost_component(COMPONENT wave            SINCE 1.33.0)

  # set output_var to found definition
  set(${x_LIBS} ${boost_libs} PARENT_SCOPE)
endfunction()
