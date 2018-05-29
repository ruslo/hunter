# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_get_configuration_types)
  set(optional "")
  set(one PACKAGE OUT)
  set(multiple "")

  # Introduce:
  # * x_PACKAGE
  # * x_OUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_OUT}")

  if(NOT HUNTER_PACKAGE_SCHEME_INSTALL)
    return()
  endif()

  set(user_types "${__HUNTER_FINAL_CONFIGURATION_TYPES_${x_PACKAGE}}")
  set(
      package_default_types
      "${__HUNTER_DEFAULT_CONFIGURATION_TYPES_${x_PACKAGE}}"
  )
  set(global_default_types "${HUNTER_CACHED_CONFIGURATION_TYPES}")

  if(NOT user_types STREQUAL "")
    set(types "${user_types}")
  elseif(NOT package_default_types STREQUAL "")
    set(types "${package_default_types}")
  elseif(NOT global_default_types STREQUAL "")
    set(types "${global_default_types}")
  else()
    hunter_internal_error("No CONFIGURATION_TYPES")
  endif()

  hunter_assert_not_empty_string("${types}")

  hunter_status_debug("Package '${x_PACKAGE}' CONFIGURATION_TYPES: ${types}")

  set("${x_OUT}" "${types}" PARENT_SCOPE)
endfunction()
