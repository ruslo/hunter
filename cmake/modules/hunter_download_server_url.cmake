# Copyright (c) 2017 NeroBurner
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_status_print)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)

# used gobal variables
# - HUNTER_DOWNLOAD_SERVER
#   - if given, a list of servers to download from

# update download url to point to HUNTER_DOWNLOAD_SERVER
# - PACKAGE:       name of the package to update the url for
# - VERSION:       version of the package
# - SHA1:          SHA1 of the package to download, only first 7 digits are used as archive-ID
# - URL:           original URL for the package
# - OUTPUT:        variable to output the updated URL
function(hunter_download_server_url)
  set(function_name "hunter_download_server_url")
  set(function_synopsis "${function_name}(PACKAGE foo VERSION 0.1.2-p3 SHA1 somelongsha URL http://original_url.example.com OUTPUT variable)")

  # parse arguments
  set(one_value_args PACKAGE VERSION SHA1 URL OUTPUT)
  cmake_parse_arguments(x "" "${one_value_args}" "" ${ARGV})

  # No free arguments allowed
  list(LENGTH x_UNPARSED_ARGUMENTS x_len)
  if(NOT x_len EQUAL "0")
    hunter_internal_error(
      "'${function_name}' incorrect usage,"
      " expected no free arguments '${x_UNPARSED_ARGUMENTS}'."
      " Synopsis: ${function_synopsis}"
    )
  endif()

  # check mandatory arguments
  foreach(arg PACKAGE VERSION SHA1 URL OUTPUT)
    string(COMPARE EQUAL "${x_${arg}}" "" is_empty)
    if(is_empty)
      hunter_internal_error(
        "'${function_name}' incorrect usage,"
        " option '${arg}' with one argument is mandatory."
        " Synopsis: ${function_synopsis}"
      )
    endif()
  endforeach()

  # default to the given URL
  set(hunter_package_new_url "${x_URL}")

  # check if download server is given
  string(COMPARE NOTEQUAL "${HUNTER_DOWNLOAD_SERVER}" "" use_download_server)
  if(NOT use_download_server)
    # nothing to be done, set variable and exit
    set(${x_OUTPUT} ${hunter_package_new_url} PARENT_SCOPE)
    return()
  endif()

  # update download url to point to HUNTER_DOWNLOAD_SERVER
  set(hunter_main_url) # variable for main_url (x_URL if it matches one of the download server)
  set(hunter_url_list) # list of URLs to try downloading from

  # extract archive-ID from archive SHA1
  string(SUBSTRING "${x_SHA1}" 0 7 archive_id)

  # get filename from download URL
  get_filename_component(package_filename_raw "${x_URL}" NAME)
  # replace special characters from filename
  string(REGEX REPLACE "[!@#$%^&*?]" "_" package_filename "${package_filename_raw}")

  foreach(list_item ${HUNTER_DOWNLOAD_SERVER})
    # create new URL
    set(download_server_url "${list_item}/${x_PACKAGE}/${x_VERSION}/${archive_id}/${package_filename}")

    # check if package URL is in the download server list
    string(FIND "${x_URL}" "${list_item}" found)
    if(NOT (found EQUAL "-1"))
      # if in list use the original URL instead of name mangling
      hunter_status_print("DOWNLOAD_SERVER: \"${x_PACKAGE}\": URL \"${x_URL}\" matches list item \"${list_item}\".")
      set(hunter_main_url "${x_URL}")
    else()
      # append URL to list of download URLs
      list(APPEND hunter_url_list "${download_server_url}")
    endif()
  endforeach()

  # check version to determine if external_project_add can handle multiple download URLs
  set(multiple_urls_allowed TRUE)
  if(CMAKE_VERSION VERSION_LESS "3.7")
    set(msg "DOWNLOAD_SERVER: Multiple URLs are not supported,")
    set(msg "${msg} only one URL will be used as download server.")
    set(msg "${msg} Use CMake 3.7+ for multiple URLs (current version: ${CMAKE_VERSION})")
    hunter_status_debug("${msg}")
    set(multiple_urls_allowed FALSE)
  endif()

  string(COMPARE NOTEQUAL "${hunter_main_url}" "" has_main_url)
  if(has_main_url)
    if(multiple_urls_allowed)
      # highest priority for original URL
      set(hunter_package_new_url "${hunter_main_url}" ${hunter_url_list})
    else()
      # use only original URL
      set(hunter_package_new_url "${hunter_main_url}")
    endif()
  else()
    if(multiple_urls_allowed)
      # try all download server one after another
      set(hunter_package_new_url ${hunter_url_list})
    else()
      # use only first server
      list(GET hunter_url_list 0 hunter_package_new_url)
    endif()
  endif()

  hunter_status_print("DOWNLOAD_SERVER: replacing URL
  PACKAGE: \"${x_PACKAGE}\"
  VERSION: \"${x_VERSION}\"
  SHA1:    \"${x_SHA1}\"
  old URL: \"${x_URL}\"
  new URL: \"${hunter_package_new_url}\"")

  set(download_command "./download_package_for_server.sh")
  set(download_command "${download_command} --PACKAGE \"${x_PACKAGE}\"")
  set(download_command "${download_command} --VERSION \"${x_VERSION}\" ")
  set(download_command "${download_command} --SHA1 \"${x_SHA1}\" ")
  set(download_command "${download_command} --URL \"${x_URL}\"")
  hunter_status_print("DOWNLOAD_SERVER: download with maintenance-script:
  ${download_command}")

  # set output_var to found definition
  set(${x_OUTPUT} ${hunter_package_new_url} PARENT_SCOPE)
endfunction()
