# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_http_password) # for included module
include(hunter_status_debug)
include(hunter_user_error)

# Read credentials for package HUNTER_PACKAGE_NAME and
# save them in parent scope variables:
# * HUNTER_PACKAGE_HTTP_USERNAME
# * HUNTER_PACKAGE_HTTP_PASSWORD
function(hunter_read_http_credentials)
  hunter_status_debug(
      "Reading HTTP credentials for protected package '${HUNTER_PACKAGE_NAME}'"
  )

  string(COMPARE EQUAL "${HUNTER_PASSWORDS_PATH}" "" cmake_is_empty)
  string(COMPARE EQUAL "$ENV{HUNTER_PASSWORDS_PATH}" "" env_is_empty)
  string(COMPARE EQUAL "$ENV{HOME}" "" home_is_empty)
  string(COMPARE EQUAL "$ENV{USERPROFILE}" "" userprofile_is_empty)

  if(NOT cmake_is_empty)
    hunter_status_debug("Using CMake variable HUNTER_PASSWORDS_PATH")
    set(pass_path "${HUNTER_PASSWORDS_PATH}")
  elseif(NOT env_is_empty)
    hunter_status_debug("Using environment variable HUNTER_PASSWORDS_PATH")
    set(pass_path "$ENV{HUNTER_PASSWORDS_PATH}")
  elseif(home_is_empty AND CMAKE_HOST_WIN32)
    if(userprofile_is_empty)
      hunter_user_error(
          "USERPROFILE environment variable is empty on Windows host"
      )
    endif()
    hunter_status_debug("Using environment variable USERPROFILE")
    set(pass_path "$ENV{USERPROFILE}/.config/Hunter/passwords.cmake")
  else()
    if(home_is_empty)
      hunter_user_error("HOME environment variable is empty")
    endif()
    hunter_status_debug("Using environment variable HOME")
    set(pass_path "$ENV{HOME}/.config/Hunter/passwords.cmake")
  endif()

  if(NOT EXISTS "${pass_path}")
    hunter_user_error("File with passwords not found: '${pass_path}'")
  endif()

  hunter_status_debug("Including file '${pass_path}'")
  include("${pass_path}")

  set(
      HUNTER_PACKAGE_HTTP_USERNAME
      "${HUNTER_PACKAGE_HTTP_USERNAME}"
      PARENT_SCOPE
  )

  set(
      HUNTER_PACKAGE_HTTP_PASSWORD
      "${HUNTER_PACKAGE_HTTP_PASSWORD}"
      PARENT_SCOPE
  )
endfunction()
