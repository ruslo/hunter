# Copyright (c) 2017 NeroBurner
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_not_empty_string)
include(hunter_append_component)

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

  # list of all boost components valid for given version
  set(boost_libs)
  # common arguments for hunter_append_component
  set(common_args LIST boost_libs VERSION ${x_VERSION})

  # DOCUMENTATION_START {
  hunter_append_component(${common_args} COMPONENT atomic          SINCE 1.53.0)
  hunter_append_component(${common_args} COMPONENT chrono          SINCE 1.47.0)
  hunter_append_component(${common_args} COMPONENT container       SINCE 1.56.0)
  hunter_append_component(${common_args} COMPONENT context         SINCE 1.51.0)
  hunter_append_component(${common_args} COMPONENT contract        SINCE 1.67.0)
  hunter_append_component(${common_args} COMPONENT coroutine       SINCE 1.53.0)
  hunter_append_component(${common_args} COMPONENT coroutine2      SINCE 1.60.0  UNTIL 1.65.0)
  hunter_append_component(${common_args} COMPONENT date_time       SINCE 1.29.0)
  hunter_append_component(${common_args} COMPONENT exception       SINCE 1.36.0)
  hunter_append_component(${common_args} COMPONENT fiber           SINCE 1.62.0)
  hunter_append_component(${common_args} COMPONENT filesystem      SINCE 1.30.0)
  hunter_append_component(${common_args} COMPONENT graph           SINCE 1.18.0)
  hunter_append_component(${common_args} COMPONENT graph_parallel  SINCE 1.18.0)
  hunter_append_component(${common_args} COMPONENT iostreams       SINCE 1.33.0)
  hunter_append_component(${common_args} COMPONENT locale          SINCE 1.48.0)
  hunter_append_component(${common_args} COMPONENT log             SINCE 1.54.0)
  hunter_append_component(${common_args} COMPONENT math            SINCE 1.23.0)
  hunter_append_component(${common_args} COMPONENT metaparse       SINCE 1.61.0 UNTIL 1.66.0)
  hunter_append_component(${common_args} COMPONENT mpi             SINCE 1.35.0)
  hunter_append_component(${common_args} COMPONENT program_options SINCE 1.32.0)
  hunter_append_component(${common_args} COMPONENT python          SINCE 1.19.0)
  hunter_append_component(${common_args} COMPONENT random          SINCE 1.15.0)
  hunter_append_component(${common_args} COMPONENT regex           SINCE 1.18.0)
  hunter_append_component(${common_args} COMPONENT serialization   SINCE 1.32.0)
  hunter_append_component(${common_args} COMPONENT signals         SINCE 1.29.0 UNTIL 1.69.0)
  hunter_append_component(${common_args} COMPONENT stacktrace      SINCE 1.65.0)
  hunter_append_component(${common_args} COMPONENT system          SINCE 1.35.0)
  hunter_append_component(${common_args} COMPONENT test            SINCE 1.21.0)
  hunter_append_component(${common_args} COMPONENT thread          SINCE 1.25.0)
  hunter_append_component(${common_args} COMPONENT timer           SINCE 1.9.0)
  hunter_append_component(${common_args} COMPONENT type_erasure    SINCE 1.60.0)
  hunter_append_component(${common_args} COMPONENT wave            SINCE 1.33.0)
  # DOCUMENTATION_END }

  # set output_var to found definition
  set(${x_LIBS} ${boost_libs} PARENT_SCOPE)
endfunction()
