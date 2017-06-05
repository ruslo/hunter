# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_check_download_error_message)
include(hunter_init_not_found_counter)
include(hunter_internal_error)
include(hunter_sleep_before_download)
include(hunter_status_debug)
include(hunter_test_string_not_empty)
include(hunter_user_error)

function(hunter_download_cache_meta_file)
  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")

  cmake_parse_arguments(x "" "LOCAL;DONE" "" ${ARGV})
  # -> x_LOCAL
  # -> x_DONE
  # -> x_UNPARSED_ARGUMENTS

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_LOCAL}" "" is_empty)
  if(is_empty)
    hunter_internal_error("LOCAL can't be empty")
  endif()

  string(COMPARE EQUAL "${x_DONE}" "" is_empty)
  if(is_empty)
    hunter_internal_error("DONE can't be empty")
  endif()

  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")
  hunter_lock_directory("${cache_directory}" "")

  string(REPLACE "${cache_directory}/meta/" "" local_suffix "${x_LOCAL}")
  string(REPLACE "${cache_directory}/meta/" "" done_suffix "${x_DONE}")

  set(local_temp "${x_LOCAL}.__HUNTER_TEMP__")
  set(done_temp "${x_DONE}.__HUNTER_TEMP__")

  if(EXISTS "${x_DONE}")
    return()
  endif()

  file(REMOVE "${x_LOCAL}")

  string(COMPARE EQUAL "${HUNTER_USE_CACHE_SERVERS}" "NO" disable_server)
  if(disable_server)
    hunter_status_debug("Skip servers")
    return()
  endif()

  list(LENGTH HUNTER_CACHE_SERVERS number_of_servers)
  hunter_init_not_found_counter(
      NOT_FOUND_NEEDED not_found_counter "${number_of_servers}"
  )

  set(total_retry 10)
  foreach(x RANGE ${total_retry})
    foreach(server ${HUNTER_CACHE_SERVERS})
      string(REGEX MATCH "^https://github.com/" is_github "${server}")
      if(NOT is_github)
        set(local_url "${server}/meta/${local_suffix}")
        set(done_url "${server}/meta/${done_suffix}")
      else()
        string(
            REPLACE
            "https://github.com/"
            "https://raw.githubusercontent.com/"
            url
            "${server}"
        )
          
        set(local_url "${url}/master/${local_suffix}")
        set(done_url "${url}/master/${done_suffix}")
      endif()

      hunter_status_debug("Downloading file (try #${x} of ${total_retry}):")
      hunter_status_debug("  ${done_url}")
      hunter_status_debug("  -> ${x_DONE}")

      hunter_sleep_before_download("${x}")
      file(DOWNLOAD "${done_url}" "${done_temp}" STATUS status)

      list(GET status 0 error_code)
      list(GET status 1 error_message)

      hunter_check_download_error_message(
          ERROR_CODE "${error_code}"
          ERROR_MESSAGE "${error_message}"
          REMOVE_ON_ERROR "${done_temp}"
          NOT_FOUND_COUNTER not_found_counter
      )

      if(NOT error_code EQUAL 0)
        if(error_code EQUAL 22)
          hunter_status_debug("File not found")
          if(NOT_FOUND_NEEDED EQUAL not_found_counter)
            return()
          endif()
        else()
          hunter_status_debug("Download error (${error_message})")
        endif()
        continue()
      endif()

      # Done stamp exists, now downloading real file
      hunter_init_not_found_counter(
          NOT_FOUND_NEEDED not_found_counter 1 # polling one server
      )

      set(total_retry ${NOT_FOUND_NEEDED})
      foreach(x RANGE ${total_retry})
        hunter_status_debug("Downloading file (try #${x} of ${total_retry}):")
        hunter_status_debug("  ${local_url}")
        hunter_status_debug("  -> ${x_LOCAL}")

        hunter_sleep_before_download("${x}")
        file(DOWNLOAD "${local_url}" "${local_temp}" STATUS status)

        list(GET status 0 error_code)
        list(GET status 1 error_message)

        hunter_check_download_error_message(
            ERROR_CODE "${error_code}"
            ERROR_MESSAGE "${error_message}"
            REMOVE_ON_ERROR "${local_temp}"
            NOT_FOUND_COUNTER not_found_counter
        )

        if(error_code EQUAL 0)
          # Success. Rename temporary files to the final destination.
          # RENAME operation is atomic. Note that DONE should be the last to
          # signal that everything ended as expected.
          file(RENAME "${local_temp}" "${x_LOCAL}")
          file(RENAME "${done_temp}" "${x_DONE}")
          return()
        elseif(error_code EQUAL 22)
          hunter_status_debug("File not found")
        else()
          hunter_status_debug("Download error (${error_message})")
        endif()
      endforeach()

      file(REMOVE "${done_temp}")
      hunter_internal_error(
          "Server error. File not exists but DONE stamp found.\n"
          "  file: ${local_url}"
          "  done: ${done_url}"
      )
    endforeach()
  endforeach()
endfunction()
