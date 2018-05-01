# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_status_debug)
include(hunter_user_error)

function(hunter_cache_server_password)
  set(opt SUB_SHA1_SUFFIX)
  set(one SERVER USERNAME PASSWORD)
  set(multi HTTPHEADER)

  cmake_parse_arguments(x "${opt}" "${one}" "${multi}" "${ARGN}")
  # -> x_SUB_SHA1_SUFFIX
  # -> x_SERVER
  # -> x_USERNAME
  # -> x_PASSWORD
  # -> x_HTTPHEADER

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_user_error(
        "'hunter_cache_server_password' unparsed arguments: ${x_UNPARSED_ARGUMENTS}"
    )
  endif()

  string(COMPARE EQUAL "${x_SERVER}" "" no_server)
  if(no_server)
    hunter_user_error("'SERVER' required")
  endif()

  string(COMPARE EQUAL "${HUNTER_CACHE_SERVER_NAME}" "" no_cache_server)
  if(no_cache_server)
    return()
  endif()

  string(COMPARE EQUAL "${HUNTER_CACHE_SERVER_NAME}" "${x_SERVER}" hit)
  if(NOT hit)
    hunter_status_debug("Skip '${HUNTER_CACHE_SERVER_NAME}' server")
    return()
  endif()

  set(httpheaders)
  foreach(httpheader ${x_HTTPHEADER})
    list(APPEND httpheaders HTTPHEADER "${httpheader}")
  endforeach()

  string(COMPARE NOTEQUAL "${x_USERNAME}" "" has_username)
  string(COMPARE NOTEQUAL "${x_PASSWORD}" "" has_password)
  set(userpwd)
  if(has_username OR has_password)
    set(userpwd USERPWD "${x_USERNAME}:${x_PASSWORD}")
  endif()

  set(HUNTER_CACHE_SERVER_USERPWD "${userpwd}" PARENT_SCOPE)
  set(HUNTER_CACHE_SERVER_HTTPHEADER "${httpheaders}" PARENT_SCOPE)
  set(HUNTER_CACHE_SERVER_SUB_SHA1_SUFFIX "${x_SUB_SHA1_SUFFIX}" PARENT_SCOPE)
endfunction()
