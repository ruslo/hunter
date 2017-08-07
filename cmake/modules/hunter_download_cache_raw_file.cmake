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

function(hunter_download_cache_raw_file)
  hunter_test_string_not_empty("${HUNTER_CACHED_ROOT}")

  cmake_parse_arguments(x "" "LOCAL;SHA1;FROMSERVER" "" ${ARGV})
  # -> x_LOCAL
  # -> x_SHA1
  # -> x_FROMSERVER
  # -> x_UNPARSED_ARGUMENTS

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)
  if(has_unparsed)
    hunter_internal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  string(COMPARE EQUAL "${x_LOCAL}" "" is_empty)
  if(is_empty)
    hunter_internal_error("LOCAL can't be empty")
  endif()

  string(COMPARE EQUAL "${x_SHA1}" "" is_empty)
  if(is_empty)
    hunter_internal_error("SHA1 can't be empty")
  endif()

  string(COMPARE EQUAL "${x_FROMSERVER}" "" is_empty)
  if(is_empty)
    hunter_internal_error("FROMSERVER can't be empty")
  endif()

  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")
  hunter_lock_directory("${cache_directory}" "")

  string(REPLACE "${cache_directory}/raw/" "" suffix "${x_LOCAL}")

  if(EXISTS "${x_LOCAL}")
    file(SHA1 "${x_LOCAL}" local_sha1)
    string(COMPARE EQUAL "${local_sha1}" "${x_SHA1}" is_good)
    if(is_good)
      return()
    endif()
    hunter_status_debug("File exists but SHA1 differs: ${x_LOCAL}")
    file(REMOVE "${x_LOCAL}")
  endif()

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
        set(url "${server}/raw/${suffix}")
      else()
        set(url "${server}/releases/download/cache/${suffix}")
      endif()

      hunter_status_debug("Downloading file (try #${x} of ${total_retry}):")
      hunter_status_debug("  ${url}")
      hunter_status_debug("  -> ${x_LOCAL}")

      hunter_sleep_before_download("${x}")

      if(HUNTER_STATUS_DEBUG)
        set(showprogress SHOW_PROGRESS)
      else()
        set(showprogress "")
      endif()

      file(DOWNLOAD "${url}" "${x_LOCAL}" STATUS status ${showprogress})
      file(SHA1 "${x_LOCAL}" local_sha1)
      string(COMPARE EQUAL "${local_sha1}" "${x_SHA1}" sha1_is_good)

      list(GET status 0 error_code)
      list(GET status 1 error_message)

      hunter_check_download_error_message(
          ERROR_CODE "${error_code}"
          ERROR_MESSAGE "${error_message}"
          REMOVE_ON_ERROR "${x_LOCAL}"
          NOT_FOUND_COUNTER not_found_counter
      )

      if(error_code EQUAL 0)
        if(sha1_is_good)
          file(WRITE "${x_FROMSERVER}" "")
          return()
        else()
          hunter_status_debug("SHA1 mismatch (retry):")
          hunter_status_debug("  ${local_sha1} (local)")
          hunter_status_debug("  ${x_SHA1} (expected)")
          file(REMOVE "${x_LOCAL}")
        endif()
      elseif(error_code EQUAL 22)
        hunter_status_debug("File not found")
        if(NOT_FOUND_NEEDED EQUAL not_found_counter)
          return()
        endif()
      else()
        hunter_status_debug("Download error (${error_message})")
      endif()
    endforeach()
  endforeach()
endfunction()

# vim:set shiftwidth=2 tabstop=2 softtabstop=2 expandtab:
