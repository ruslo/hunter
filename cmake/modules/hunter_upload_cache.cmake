# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(hunter_http_password)
include(hunter_internal_error)
include(hunter_private_data_password)
include(hunter_test_string_not_empty)
include(hunter_upload_password)
include(hunter_user_error)

function(hunter_upload_cache)
  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_BUILD_DIR}")
  hunter_test_string_not_empty("${HUNTER_SELF}")

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
  include("${pass_path}")

  string(COMPARE EQUAL "${HUNTER_UPLOAD_REPO_OWNER}" "" empty_repo_owner)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_REPO}" "" empty_repo)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_USERNAME}" "" empty_username)
  string(COMPARE EQUAL "${HUNTER_UPLOAD_PASSWORD}" "" empty_password)

  if(empty_repo_owner AND empty_repo AND empty_username AND empty_password)
    hunter_user_error(
        "Upload parameters are empty, 'hunter_upload_password' is missing?"
    )
  endif()

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

  if(ANDROID)
    # Emulate find_host_program
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER)
  endif()

  find_package(PythonInterp 3 QUIET)

  if(NOT PYTHONINTERP_FOUND)
    hunter_user_error("Python not found (required for uploading)")
  endif()

  hunter_status_debug("Upload using Python: ${PYTHON_EXECUTABLE}")

  set(upload_script "${HUNTER_SELF}/scripts/upload-cache-to-github.py")
  if(NOT EXISTS "${upload_script}")
    hunter_internal_error("Script not found: ${upload_script}")
  endif()

  set(temp_dir "${HUNTER_PACKAGE_BUILD_DIR}/__temp")
  file(MAKE_DIRECTORY "${temp_dir}")

  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")

  execute_process(
      COMMAND
      "${PYTHON_EXECUTABLE}"
      "${upload_script}"
      --repo-owner "${HUNTER_UPLOAD_REPO_OWNER}"
      --repo "${HUNTER_UPLOAD_REPO}"
      --username "${HUNTER_UPLOAD_USERNAME}"
      --password "${HUNTER_UPLOAD_PASSWORD}"
      --cache-dir "${cache_directory}"
      --temp-dir "${temp_dir}"
      WORKING_DIRECTORY "${CELLAR_RAW_DIRECTORY}"
      RESULT_VARIABLE result
  )

  file(REMOVE_RECURSE "${HUNTER_PACKAGE_BUILD_DIR}")

  if(NOT result EQUAL "0")
    hunter_internal_error("Upload script failed")
  endif()
endfunction()
