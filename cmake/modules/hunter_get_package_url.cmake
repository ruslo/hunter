# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_download_server_url)

function(hunter_get_package_url)
  set(optional "")
  set(one PACKAGE VERSION SHA1 OUT)
  set(multiple "")

  # Introduce:
  # * x_PACKAGE
  # * x_VERSION
  # * x_SHA1
  # * x_OUT
  cmake_parse_arguments(x "${optional}" "${one}" "${multiple}" "${ARGV}")

  hunter_assert_empty_string("${x_UNPARSED_ARGUMENTS}")

  hunter_assert_not_empty_string("${x_PACKAGE}")
  hunter_assert_not_empty_string("${x_VERSION}")
  hunter_assert_not_empty_string("${x_SHA1}")
  hunter_assert_not_empty_string("${x_OUT}")

  set(user_url "${__HUNTER_FINAL_URL_${x_PACKAGE}}")
  if(NOT user_url STREQUAL "")
    # URL from user's local 'hunter_config'. It's either local Git archive or
    # explicitly specified URL.
    set("${x_OUT}" "${user_url}" PARENT_SCOPE)
    return()
  endif()

  set(hunter_url "${HUNTER_${x_PACKAGE}_URL}")

  hunter_assert_not_empty_string("${hunter_url}")

  # set download URL, either direct download or redirected if HUNTER_DOWNLOAD_SERVER is set
  hunter_download_server_url(
    PACKAGE "${x_PACKAGE}"
    VERSION "${x_VERSION}"
    SHA1 "${x_SHA1}"
    URL "${hunter_url}"
    OUTPUT result_url
  )

  set("${x_OUT}" "${result_url}" PARENT_SCOPE)
endfunction()
