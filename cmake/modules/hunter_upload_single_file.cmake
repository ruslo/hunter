# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(hunter_internal_error)
include(hunter_sleep_before_download)
include(hunter_status_debug)

function(hunter_upload_single_file filename)
  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")
  hunter_assert_not_empty_string("${HUNTER_UPLOAD_SERVER}")

  set(cache_root_dir "${HUNTER_CACHED_ROOT}/_Base/Cache")
  if(NOT EXISTS ${cache_root_dir})
    hunter_internal_error("Not found: ${cache_root_dir}")
  endif()

  set(full_path "${cache_root_dir}/${filename}")
  if(NOT EXISTS ${full_path})
    hunter_internal_error("File not found: ${full_path}")
  endif()

  set(upload_url "${HUNTER_UPLOAD_SERVER}/${filename}")

  if(HUNTER_UPLOAD_SUB_SHA1_SUFFIX)
    string(
        REGEX
        REPLACE
        "/cache\\.sha1$"
        "/cache_sha1"
        upload_url
        "${upload_url}"
    )
  endif()

  string(COMPARE EQUAL "${HUNTER_UPLOAD_USERNAME}" "" empty_username)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_PASSWORD}" "" empty_password)

  if(empty_username AND empty_password)
    set(userpwd "")
  else()
    set(userpwd USERPWD "${HUNTER_UPLOAD_USERNAME}:${HUNTER_UPLOAD_PASSWORD}")
  endif()

  string(COMPARE EQUAL "${HUNTER_UPLOAD_HTTPHEADER}" "" empty_httpheader)
  if(empty_httpheader)
    set(httpheader "")
  else()
    set(httpheader "")
    foreach(header ${HUNTER_UPLOAD_HTTPHEADER})
      list(APPEND httpheader HTTPHEADER "${header}")
    endforeach()
  endif()

  file(SHA256 "${full_path}" sha256_value)
  file(SHA1 "${full_path}" sha1_value)
  file(MD5 "${full_path}" md5_value)

  list(APPEND httpheader HTTPHEADER "X-Checksum-Sha256: ${sha256_value}")
  list(APPEND httpheader HTTPHEADER "X-Checksum-Sha1: ${sha1_value}")
  list(APPEND httpheader HTTPHEADER "X-Checksum: ${md5_value}")

  set(total_retry 10)
  foreach(x RANGE ${total_retry})
    hunter_status_debug("Uploading file (try #${x} of ${total_retry}):")
    hunter_status_debug("  ${full_path}")
    hunter_status_debug("  -> ${upload_url}")

    # right name is 'hunter_sleep_before_upload'
    hunter_sleep_before_download("${x}")

    file(
        UPLOAD "${full_path}" "${upload_url}"
        STATUS status
        ${userpwd}
        ${httpheader}
    )

    list(GET status 0 error_code)
    list(GET status 1 error_message)

    if(error_code EQUAL "0")
      return()
    endif()

    hunter_status_debug("Upload failed")
    hunter_status_debug("Error code: ${error_code}")
    hunter_status_debug("Error message: ${error_message}")
  endforeach()

  hunter_internal_error("Upload failed")
endfunction()
