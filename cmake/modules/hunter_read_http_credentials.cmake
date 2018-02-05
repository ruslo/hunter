# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_http_password) # for included module
include(hunter_get_passwords_path)
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

  hunter_get_passwords_path(pass_path)

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
