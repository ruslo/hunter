# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_fatal_error)
include(hunter_test_string_not_empty)

function(hunter_find_stamps)
  hunter_test_string_not_empty("${HUNTER_PACKAGE_BASENAME}")
  hunter_test_string_not_empty("${HUNTER_BASE}")

  set(one NAME RESULT)
  set(multi VARIANTS)

  cmake_parse_arguments(x "" "${one}" "${multi}" ${ARGV})

  if(x_UNPARSED_ARGUMENTS)
    hunter_fatal_error("Unparsed: ${x_UNPARSED_ARGUMENTS}")
  endif()

  if(NOT x_NAME)
    hunter_fatal_error("NAME argument is required")
  endif()

  string(COMPARE EQUAL "${x_NAME}" "install" is_install)
  string(COMPARE EQUAL "${x_NAME}" "configure" is_configure)
  if(NOT is_install AND NOT is_configure)
    hunter_fatal_error(
        "NAME argument `${x_NAME}` is not `install` or `configure`"
    )
  endif()

  if(NOT x_RESULT)
    hunter_fatal_error("RESULT argument is required")
  endif()

  if(NOT x_VARIANTS)
    set(x_VARIANTS "-")
  endif()

  set(found_files_list "")

  foreach(variant ${x_VARIANTS})
    string(COMPARE EQUAL "${variant}" "-" is_empty)
    if(is_empty)
      set(x "${HUNTER_PACKAGE_BASENAME}")
    else()
      set(x "${HUNTER_PACKAGE_BASENAME}-${variant}")
    endif()
    set(stamp_result "STAMP-NOTFOUND") # search again
    find_file(
        stamp_result
        "${x}-${x_NAME}"
        PATHS
        "${HUNTER_BASE}/Stamp/${x}/"
        NO_DEFAULT_PATH
        PATH_SUFFIXES
        Debug # tested on windows with Visual Studio 2013
        Debug-iphoneos # tested on Mac OS X with Xcode
    )
    if(stamp_result)
      list(APPEND found_files_list "${stamp_result}")
    endif()
  endforeach()

  set(${x_RESULT} ${found_files_list} PARENT_SCOPE)
endfunction()
