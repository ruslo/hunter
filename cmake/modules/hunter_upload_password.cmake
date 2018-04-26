# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_user_error)

function(hunter_upload_password)
  set(opt SUB_SHA1_SUFFIX)
  set(one REPO_OWNER REPO USERNAME PASSWORD SERVER)
  set(multi HTTPHEADER)

  cmake_parse_arguments(x "${opt}" "${one}" "${multi}" "${ARGN}")
  # -> x_SUB_SHA1_SUFFIX
  # -> x_REPO_OWNER
  # -> x_REPO
  # -> x_USERNAME
  # -> x_PASSWORD
  # -> x_SERVER
  # -> x_HTTPHEADER

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_user_error(
        "'hunter_upload_password' unparsed arguments: ${x_UNPARSED_ARGUMENTS}"
    )
  endif()

  string(COMPARE NOTEQUAL "${x_SERVER}" "" has_server)
  string(COMPARE NOTEQUAL "${x_REPO_OWNER}" "" has_repo_owner)
  string(COMPARE NOTEQUAL "${x_REPO}" "" has_repo)
  string(COMPARE NOTEQUAL "${x_HTTPHEADER}" "" has_httpheader)

  if(has_server)
    # Not GitHub server
    if(has_repo_owner)
      hunter_user_error("Unexpected REPO_OWNER")
    endif()
    if(has_repo)
      hunter_user_error("Unexpected REPO")
    endif()
  else()
    # GitHub server
    if(has_httpheader)
      hunter_user_error("Unexpected HTTPHEADER")
    endif()
    if(x_SUB_SHA1_SUFFIX)
      hunter_user_error("Unexpected SUB_SHA1_SUFFIX")
    endif()
  endif()

  set(HUNTER_UPLOAD_REPO_OWNER "${x_REPO_OWNER}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_REPO "${x_REPO}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_USERNAME "${x_USERNAME}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_PASSWORD "${x_PASSWORD}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_SERVER "${x_SERVER}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_SUB_SHA1_SUFFIX "${x_SUB_SHA1_SUFFIX}" PARENT_SCOPE)
  set(HUNTER_UPLOAD_HTTPHEADER "${x_HTTPHEADER}" PARENT_SCOPE)
endfunction()
