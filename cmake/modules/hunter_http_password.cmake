# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

function(hunter_http_password package_name)
  set(one USERNAME PASSWORD)

  cmake_parse_arguments(x "" "${one}" "" "${ARGN}")
  # -> x_USERNAME
  # -> x_PASSWORD

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internale_error("Unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${HUNTER_PACKAGE_NAME}" "${package_name}" hit)
  if(hit)
    set(HUNTER_PACKAGE_HTTP_USERNAME "${x_USERNAME}" PARENT_SCOPE)
    set(HUNTER_PACKAGE_HTTP_PASSWORD "${x_PASSWORD}" PARENT_SCOPE)
  endif()
endfunction()
