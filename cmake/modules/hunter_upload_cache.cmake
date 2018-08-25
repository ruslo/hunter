# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(hunter_cache_server_password)
include(hunter_get_passwords_path)
include(hunter_http_password)
include(hunter_internal_error)
include(hunter_private_data_password)
include(hunter_assert_not_empty_string)
include(hunter_upload_password)
include(hunter_upload_to_custom_server)
include(hunter_user_error)

function(hunter_upload_cache)
  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")
  hunter_assert_not_empty_string("${HUNTER_PACKAGE_BUILD_DIR}")
  hunter_assert_not_empty_string("${HUNTER_SELF}")

  if(NOT HUNTER_RUN_UPLOAD)
    return()
  endif()

  hunter_status_debug("Uploading cache")

  hunter_get_passwords_path(pass_path)

  hunter_status_debug("Including file '${pass_path}'")

  # May use:
  # * hunter_http_password
  # * hunter_private_data_password
  # * hunter_upload_password
  # * hunter_cache_server_password
  include("${pass_path}")

  string(COMPARE EQUAL "${HUNTER_UPLOAD_REPO_OWNER}" "" empty_repo_owner)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_REPO}" "" empty_repo)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_USERNAME}" "" empty_username)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_PASSWORD}" "" empty_password)

  string(COMPARE EQUAL "${HUNTER_UPLOAD_SERVER}" "" empty_server)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_SUB_SHA1_SUFFIX}" "" empty_sub_sha1_suffix)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_HTTPHEADER}" "" empty_httpheader)

  if(
      empty_repo_owner
      AND empty_repo
      AND empty_username
      AND empty_password
      AND empty_server
      AND empty_sub_sha1_suffix
      AND empty_httpheader
  )
    hunter_user_error(
        "Upload parameters are empty, 'hunter_upload_password' is missing?"
    )
  endif()

  if(empty_server)
    if(empty_repo_owner)
      hunter_user_error("Upload: REPO_OWNER is missing")
    endif()
    if(empty_repo)
      hunter_user_error("Upload: REPO is missing")
    endif()
    if(empty_username)
      hunter_user_error("Upload: USERNAME is missing")
    endif()
    if(empty_password)
      hunter_user_error("Upload: PASSWORD is missing")
    endif()
  else()
    hunter_upload_to_custom_server()
    file(REMOVE_RECURSE "${HUNTER_PACKAGE_BUILD_DIR}")
    return()
  endif()

  # Run isolated script to aviod cross-compiling issues and
  # other variables effects
  execute_process(
      COMMAND ${CMAKE_COMMAND} -P ${HUNTER_SELF}/scripts/find_python.cmake
      RESULT_VARIABLE result
      OUTPUT_VARIABLE python_path
      ERROR_VARIABLE python_path
      OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  if(result EQUAL "0")
    hunter_status_debug("Upload using Python: '${python_path}'")
  else()
    hunter_user_error("Python not found (required for uploading)")
  endif()

  set(upload_script "${HUNTER_SELF}/scripts/upload-cache-to-github.py")
  if(NOT EXISTS "${upload_script}")
    hunter_internal_error("Script not found: ${upload_script}")
  endif()

  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")

  execute_process(
      COMMAND
      "${python_path}"
      "${upload_script}"
      --repo-owner "${HUNTER_UPLOAD_REPO_OWNER}"
      --repo "${HUNTER_UPLOAD_REPO}"
      --username "${HUNTER_UPLOAD_USERNAME}"
      --password "${HUNTER_UPLOAD_PASSWORD}"
      --cache-dir "${cache_directory}"
      WORKING_DIRECTORY "${CELLAR_RAW_DIRECTORY}"
      RESULT_VARIABLE result
  )

  file(REMOVE_RECURSE "${HUNTER_PACKAGE_BUILD_DIR}")

  if(NOT result EQUAL "0")
    hunter_internal_error("Upload script failed")
  endif()
endfunction()
