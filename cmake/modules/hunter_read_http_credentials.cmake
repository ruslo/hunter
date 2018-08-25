# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(hunter_cache_server_password)
include(hunter_get_passwords_path)
include(hunter_http_password)
include(hunter_private_data_password)
include(hunter_status_debug)
include(hunter_upload_password)

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

  # May use:
  # * hunter_http_password
  # * hunter_private_data_password
  # * hunter_upload_password
  # * hunter_cache_server_password
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
