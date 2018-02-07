# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_user_error)

function(hunter_private_data_password)
  set(one CREDENTIALS USERNAME PASSWORD)

  cmake_parse_arguments(x "" "${one}" "" "${ARGN}")
  # -> x_CREDENTIALS
  # -> x_USERNAME
  # -> x_PASSWORD

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    set(func "'hunter_private_data_password'")
    hunter_user_error("${func} unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(
      COMPARE
      EQUAL
      "${x_CREDENTIALS}"
      "${HUNTER_PRIVATE_DATA_CREDENTIALS}"
      hit
  )

  if(hit)
    set(HUNTER_PRIVATE_DATA_USERNAME "${x_USERNAME}" PARENT_SCOPE)
    set(HUNTER_PRIVATE_DATA_PASSWORD "${x_PASSWORD}" PARENT_SCOPE)
  endif()
endfunction()
