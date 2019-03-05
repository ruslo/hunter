# Copyright (c) 2018, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_cache_server_password)
include(hunter_check_download_error_message)
include(hunter_get_passwords_path)
include(hunter_http_password)
include(hunter_init_not_found_counter)
include(hunter_internal_error)
include(hunter_lock_directory)
include(hunter_private_data_password)
include(hunter_sleep_before_download)
include(hunter_step_into_unpacked_directory)
include(hunter_upload_password)
include(hunter_user_error)

function(hunter_private_data)
  set(func "'hunter_private_data'")

  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")

  set(one URL SHA1 CREDENTIALS LOCATION FILE)
  set(multiple HTTPHEADER)

  cmake_parse_arguments(x "" "${one}" "${multiple}" "${ARGN}")
  # -> x_URL
  # -> x_SHA1
  # -> x_CREDENTIALS
  # -> x_LOCATION
  # -> x_FILE
  # -> x_HTTPHEADER

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_user_error("${func} unparsed arguments: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_URL}" "" is_empty)
  if(is_empty)
    hunter_user_error("${func}: URL is missing")
  endif()

  string(COMPARE EQUAL "${x_SHA1}" "" is_empty)
  if(is_empty)
    hunter_user_error("${func}: SHA1 is missing")
  endif()

  string(COMPARE EQUAL "${x_LOCATION}" "" is_empty)
  if(is_empty)
    hunter_user_error("${func}: LOCATION is missing")
  endif()

  string(COMPARE EQUAL "${x_FILE}" "" do_unpack)
  if(NOT do_unpack)
    get_filename_component(file_name "${x_FILE}" NAME)
    string(COMPARE EQUAL "${file_name}" "${x_FILE}" ok)
    if(NOT ok)
      hunter_user_error(
          "${func}: FILE with directories not allowed '${x_FILE}'"
      )
    endif()
  endif()

  set(priv_dir_root "${HUNTER_CACHED_ROOT}/_Base/PrivateData")

  hunter_make_directory("${priv_dir_root}/${x_SHA1}" "${x_SHA1}" priv_dir)
  set(done_stamp "${priv_dir}/unpack.DONE")
  set(raw_dir "${priv_dir}/raw")
  set(param_file "${priv_dir}/param.file") # consistency check

  if(do_unpack)
    # return path to unpacked directory
    set(output "${raw_dir}")
    set(dst_file "${priv_dir}/archive.file")
  else()
    # return path to file
    set(output "${raw_dir}/${x_FILE}")
    set(dst_file "${output}")
  endif()

  if(NOT EXISTS "${done_stamp}")
    hunter_lock_directory("${priv_dir}" "")
  endif()

  # While waiting for lock other instance can do all the job
  if(EXISTS "${done_stamp}")
    if(EXISTS "${dst_file}")
      if(NOT EXISTS "${output}")
        hunter_internal_error("File not found: '${output}'")
      endif()

      if(do_unpack)
        hunter_step_into_unpacked_directory("${output}" output)
      endif()

      set("${x_LOCATION}" ${output} PARENT_SCOPE)
      return()
    endif()

    # Something went wrong
    if(EXISTS "${param_file}")
      # Previous call was with FILE
      file(READ "${param_file}" file_value)
      string(COMPARE EQUAL "${file_value}" "" is_empty)
      if(is_empty)
        hunter_internal_error("Value from ${param_file} is empty")
      endif()
    else()
      set(file_value "")
    endif()

    if(do_unpack)
      # archive.file not found, previous call was with FILE
      hunter_user_error(
          "Inconsistent ${func}.\n"
          "Previous call was with 'FILE ${file_value}'"
      )
    else()
      # raw/<filename> not found, previous call was with different FILE
      # or without FILE
      string(COMPARE EQUAL "${file_value}" "" is_empty)
      if(is_empty)
        hunter_user_error(
            "Inconsistent ${func}.\n"
            "Previous call was without 'FILE'"
        )
      else()
        hunter_user_error(
            "Inconsistent ${func}.\n"
            "Previous call was with 'FILE ${file_value}'"
        )
      endif()
    endif()
  endif()

  file(REMOVE "${param_file}")

  string(COMPARE NOTEQUAL "${x_CREDENTIALS}" "" protected)
  if(protected)
    set(HUNTER_PRIVATE_DATA_CREDENTIALS "${x_CREDENTIALS}")
    hunter_get_passwords_path(pass_path)

    # May use:
    # * hunter_http_password
    # * hunter_private_data_password
    # * hunter_upload_password
    # * hunter_cache_server_password
    include("${pass_path}")

    string(COMPARE EQUAL "${HUNTER_PRIVATE_DATA_USERNAME}" "" no_username)
    string(COMPARE EQUAL "${HUNTER_PRIVATE_DATA_PASSWORD}" "" no_password)

    if(no_username AND no_password)
      hunter_user_error(
          "Credentials for '${x_CREDENTIALS}' are empty,\n"
          "'hunter_private_data_password' is missing?"
      )
    endif()

    if(no_username)
      hunter_user_error("Private data: USERNAME is missing")
    endif()

    if(no_password)
      hunter_user_error("Private data: PASSWORD is missing")
    endif()
  endif()

  if(HUNTER_STATUS_DEBUG)
    set(progress SHOW_PROGRESS)
  else()
    set(progress "")
  endif()

  if(protected)
    set(
        userpwd
        USERPWD
        "${HUNTER_PRIVATE_DATA_USERNAME}:${HUNTER_PRIVATE_DATA_PASSWORD}"
    )
  else()
    set(userpwd "")
  endif()

  string(COMPARE EQUAL "${x_HTTPHEADER}" "" no_header)
  if(no_header)
    set(httpheader "")
  else()
    foreach(header ${x_HTTPHEADER})
      list(APPEND httpheader HTTPHEADER "${header}")
    endforeach()
  endif()

  hunter_init_not_found_counter(NOT_FOUND_NEEDED not_found_counter "1")

  set(download_done FALSE)

  set(total_retry 10)
  foreach(x RANGE ${total_retry})
    if(EXISTS "${dst_file}")
      file(SHA1 "${dst_file}" local_sha1)
      string(COMPARE EQUAL "${local_sha1}" "${x_SHA1}" is_good)
      if(is_good)
        set(download_done TRUE)
      else()
        hunter_status_debug("File exists but SHA1 differs: '${dst_file}'")
        file(REMOVE "${dst_file}")
      endif()
    endif()

    if(download_done)
      # TODO: Update to CMake 3.2 to use 'continue'
    else()

      hunter_status_debug("Downloading file (try #${x} of ${total_retry}):")
      hunter_status_debug("  ${x_URL}")
      hunter_status_debug("  -> ${dst_file}")

      hunter_sleep_before_download("${x}")

      file(
          DOWNLOAD
          "${x_URL}"
          "${dst_file}"
          ${progress}
          STATUS status
          ${userpwd}
          ${httpheader}
          TLS_VERIFY ${HUNTER_TLS_VERIFY}
      )
      file(SHA1 "${dst_file}" local_sha1)

      string(COMPARE EQUAL "${local_sha1}" "${x_SHA1}" sha1_is_good)

      list(GET status 0 error_code)
      list(GET status 1 error_message)

      hunter_check_download_error_message(
          ERROR_CODE "${error_code}"
          ERROR_MESSAGE "${error_message}"
          REMOVE_ON_ERROR "${dst_file}"
          NOT_FOUND_COUNTER not_found_counter
      )

      if(error_code EQUAL 0)
        if(sha1_is_good)
          set(download_done TRUE)
        else()
          hunter_status_debug("SHA1 mismatch (retry):")
          hunter_status_debug("  ${local_sha1} (local)")
          hunter_status_debug("  ${x_SHA1} (expected)")
          file(REMOVE "${dst_file}")
        endif()
      elseif(error_code EQUAL 22)
        hunter_status_debug("File not found")
        if(NOT_FOUND_NEEDED EQUAL not_found_counter)
          hunter_user_error("File not found by URL '${x_URL}'")
        endif()
      else()
        hunter_status_debug("Download error (${error_message})")
      endif()
    endif()
  endforeach()

  if(NOT download_done)
    hunter_user_error("Download failed")
  endif()

  if(do_unpack)
    if(EXISTS "${output}")
      hunter_status_debug("Removing directory '${output}'")
      file(REMOVE_RECURSE "${output}")
    endif()
    file(MAKE_DIRECTORY "${output}")
    hunter_status_debug("Unpacking archive '${dst_file}' to '${output}'")
    if(HUNTER_STATUS_DEBUG AND NOT HUNTER_SUPPRESS_LIST_OF_FILES)
      set(tar_params "xvf")
    else()
      set(tar_params "xf")
    endif()
    execute_process(
        COMMAND "${CMAKE_COMMAND}" -E tar ${tar_params} "${dst_file}"
        WORKING_DIRECTORY "${output}"
        RESULT_VARIABLE result
    )
    if(NOT result EQUAL "0")
      hunter_user_error("Unpacking failed")
    endif()
  endif()

  if(do_unpack)
    hunter_step_into_unpacked_directory("${output}" output)
  endif()

  set("${x_LOCATION}" ${output} PARENT_SCOPE)

  if(NOT do_unpack)
    file(WRITE "${param_file}" "${x_FILE}")
  endif()

  file(WRITE "${done_stamp}" "")
endfunction()
