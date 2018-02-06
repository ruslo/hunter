# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_user_error)

function(hunter_upload_password)
  set(one REPO_OWNER REPO USERNAME PASSWORD)

  cmake_parse_arguments(x "" "${one}" "" "${ARGN}")
  # -> x_REPO_OWNER
  # -> x_REPO
  # -> x_USERNAME
  # -> x_PASSWORD

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_user_error(
        "'hunter_upload_password' unparsed arguments: ${x_UNPARSED_ARGUMENTS}"
    )
  endif()

  set(HUNTER_UPLOAD_REPO_OWNER "${x_REPO_OWNER}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_REPO "${x_REPO}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_USERNAME "${x_USERNAME}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_PASSWORD "${x_PASSWORD}" PARENT_SCOPE)
endfunction()
