# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_internal_error)
include(hunter_status_debug)

function(hunter_get_keep_package_sources)
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

  set(user_keep "${__HUNTER_FINAL_KEEP_PACKAGE_SOURCES_${x_PACKAGE}}")
  if(user_keep STREQUAL "")
    if(HUNTER_KEEP_PACKAGE_SOURCES)
      set(keep_sources YES)
    else()
      set(keep_sources NO)
    endif()
  else()
    if(user_keep STREQUAL "TRUE")
      set(keep_sources YES)
    else()
      hunter_internal_error("Unexpected")
    endif()
  endif()

  hunter_status_debug(
      "Keep sources for package '${x_PACKAGE}': ${keep_sources}"
  )

  set("${x_OUT}" "${keep_sources}" PARENT_SCOPE)
endfunction()
