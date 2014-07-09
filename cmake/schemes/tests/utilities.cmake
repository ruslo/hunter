# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_fatal_error)

function(execute_test)
  execute_process(
      COMMAND
      ${ARGV}
      WORKING_DIRECTORY
      "${DOWNLOAD_PROJECT_BASE}"
      RESULT_VARIABLE
      TEST_RESULT
  )

  if(NOT ${TEST_RESULT} EQUAL 0)
    hunter_fatal_error("Test exit with: ${TEST_RESULT}")
  endif()
endfunction()

function(check_installed_static_lib libname)
  set(libpath "${HUNTER_PACKAGE_INSTALL_DIR}")
  set(libpath "${libpath}/${CMAKE_STATIC_LIBRARY_PREFIX}${libname}")
  set(libpath_release "${libpath}${CMAKE_STATIC_LIBRARY_SUFFIX}")
  set(libpath_debug "${libpath}${CMAKE_DEBUG_POSTFIX}")
  set(libpath_debug "${libpath_debug}${CMAKE_STATIC_LIBRARY_SUFFIX}")

  if(NOT EXISTS "${libpath_release}")
    hunter_fatal_error("Static lib not found: ${libpath_release}")
  endif()
  if(NOT EXISTS "${libpath_debug}")
    hunter_fatal_error("Static lib not found: ${libpath_debug}")
  endif()
endfunction()
