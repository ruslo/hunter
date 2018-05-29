# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)
include(hunter_user_error)

function(hunter_get_package_sha1)
  set(optional "")
  set(one PACKAGE VERSION OUT)
  set(multiple AVAILABLE_VERSIONS)

  # Introduce:
  # * x_PACKAGE
  # * x_VERSION
  # * x_AVAILABLE_VERSIONS
  # * x_OUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_VERSION}")
  hunter_assert_not_empty_string("${x_OUT}")

  set(user_sha1 "${__HUNTER_FINAL_SHA1_${x_PACKAGE}}")
  set(hunter_sha1 "${HUNTER_${x_PACKAGE}_SHA1}")

  if(NOT user_sha1 STREQUAL "" AND NOT hunter_sha1 STREQUAL "")
    hunter_internal_error("Unexpected")
  endif()

  if(NOT user_sha1 STREQUAL "")
    set("${x_OUT}" "${user_sha1}" PARENT_SCOPE)
  elseif(NOT hunter_sha1 STREQUAL "")
    set("${x_OUT}" "${hunter_sha1}" PARENT_SCOPE)
  else()
    if(NOT "${x_AVAILABLE_VERSIONS}" STREQUAL "")
      hunter_status_debug("Available versions:")
      foreach(version ${x_AVAILABLE_VERSIONS})
        hunter_status_debug("* ${version}")
      endforeach()
    endif()

    hunter_user_error(
        "Version not found: ${x_VERSION}. Please check 'hunter_config' command."
    )
  endif()
endfunction()
