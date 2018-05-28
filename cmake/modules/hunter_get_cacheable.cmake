# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)
include(hunter_user_error)

function(hunter_get_cacheable)
  set(optional "")
  set(one PACKAGE OUT)
  set(multiple UNRELOCATABLE)

  # Introduce:
  # * x_PACKAGE
  # * x_OUT
  # * x_UNRELOCATABLE
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_OUT}")

  if(__HUNTER_CACHEABLE_${x_PACKAGE})
    set(cacheable YES)
  else()
    set(cacheable NO)

    if(NOT "${x_UNRELOCATABLE}" STREQUAL "")
      hunter_user_error(
          "PACKAGE_UNRELOCATABLE_TEXT_FILES for uncacheable package:"
          "  please add hunter_cacheable to hunter.cmake"
      )
    endif()
  endif()

  hunter_status_debug("Package '${x_PACKAGE}' is cacheable: ${cacheable}")

  set("${x_OUT}" "${cacheable}" PARENT_SCOPE)
endfunction()
