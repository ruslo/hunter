# Copyright (c) 2013-2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0) # sleep

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_check_already_installed)
include(hunter_fatal_error)
include(hunter_find_stamps)
include(hunter_get_temp_directory)
include(hunter_internal_error)
include(hunter_lock)
include(hunter_status_debug)
include(hunter_status_print)
include(hunter_test_string_not_empty)
include(hunter_unlock)

function(hunter_download)
  set(
      h_one_value
      PACKAGE_NAME # Foo
      PACKAGE_COMPONENT
  )

  cmake_parse_arguments(
      HUNTER "" "${h_one_value}" "" ${ARGV}
  )
  # -> HUNTER_PACKAGE_NAME
  # -> HUNTER_PACKAGE_COMPONENT

  if(h_UNPARSED_ARGUMENTS)
    hunter_internal_error("Unparsed")
  endif()

  set(versions "[${HUNTER_${HUNTER_PACKAGE_NAME}_VERSIONS}]")
  hunter_status_debug(
      "${HUNTER_PACKAGE_NAME} versions available: ${versions}"
  )

  hunter_test_string_not_empty("${HUNTER_BASE}")
  hunter_test_string_not_empty("${HUNTER_DOWNLOAD_SCHEME}")
  hunter_test_string_not_empty("${HUNTER_INSTALL_TAG}")
  hunter_test_string_not_empty("${HUNTER_SELF}")

  # Set <LIB>_ROOT variables
  set(h_name "${HUNTER_PACKAGE_NAME}") # Foo
  string(TOUPPER "${h_name}" h_root_name) # FOO
  set(h_root_name "${h_root_name}_ROOT") # FOO_ROOT

  set(ver ${HUNTER_${h_name}_VERSION})
  if(NOT ver AND ${h_root_name})
    # function `hunter_add_version` will skip set if root already
    # defined by custom location => ver is empty
    return()
  endif()

  if(NOT DEFINED HUNTER_DOWNLOAD_SCHEME_INSTALL)
    hunter_internal_error("HUNTER_DOWNLOAD_SCHEME_INSTALL not defined")
  endif()
  if(HUNTER_DOWNLOAD_SCHEME_INSTALL)
    set(${h_root_name} "${HUNTER_BASE}/Install/${HUNTER_INSTALL_TAG}")
  else()
    set(${h_root_name} "${HUNTER_BASE}/Source/${h_name}")
  endif()

  list(APPEND CMAKE_PREFIX_PATH "${${h_root_name}}")
  set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)

  set(${h_root_name} "${${h_root_name}}" PARENT_SCOPE)
  set(ENV{${h_root_name}} "${${h_root_name}}")
  hunter_status_print("${h_root_name}: ${${h_root_name}} (ver.: ${ver})")

  # creating temporary working directory where download project will reside
  if(NOT CMAKE_BINARY_DIR)
    hunter_internal_error(
        "CMAKE_BINARY_DIR is empty. "
        "Move file **after** first 'project' command"
    )
  endif()

  # HUNTER_PACKAGE_BASENAME = <name[-component]-tag>
  set(HUNTER_PACKAGE_BASENAME "${HUNTER_PACKAGE_NAME}")
  if(HUNTER_PACKAGE_COMPONENT)
    set(
        HUNTER_PACKAGE_BASENAME
        "${HUNTER_PACKAGE_BASENAME}-${HUNTER_PACKAGE_COMPONENT}"
    )
  endif()
  set(
      HUNTER_PACKAGE_BASENAME
      "${HUNTER_PACKAGE_BASENAME}-${HUNTER_INSTALL_TAG}"
  )

  # Optimization
  # Use: HUNTER_PACKAGE_BASENAME and HUNTER_BASE
  hunter_check_already_installed(
      VARIANTS ${HUNTER_DOWNLOAD_SCHEME_VARIANTS}
      RESULT do_skip
  )
  if(do_skip)
    hunter_status_debug("Skip generate/run (already installed)")
    return()
  endif()

  hunter_lock() # Spin until lock not done

  # We need to check it one more time in case that another
  # locked process install this package
  # Use: HUNTER_PACKAGE_BASENAME and HUNTER_BASE
  hunter_check_already_installed(
      VARIANTS ${HUNTER_DOWNLOAD_SCHEME_VARIANTS}
      RESULT do_skip_2
  )
  if(do_skip_2)
    hunter_status_debug("Skip generate/run (already installed)")
    hunter_unlock()
    return()
  endif()

  ### Directory modifications start from here
  ### Expected that only one process working
  set(h_work_dir "${CMAKE_BINARY_DIR}/_3rdParty/hunter/external")
  file(REMOVE_RECURSE "${h_work_dir}")

  hunter_get_temp_directory("${h_work_dir}" h_work_dir) # pure
  hunter_test_string_not_empty("${h_work_dir}")
  set(h_build_dir "${h_work_dir}/_builds")

  # create temp toolchain file to set environment variables
  # and include real toolchain
  set(HUNTER_DOWNLOAD_TOOLCHAIN "${h_work_dir}/toolchain.cmake")

  # pass HUNTER_ROOT and HUNTER_SHA1 to all packages
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_ROOT \"${HUNTER_ROOT}\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(ENV{HUNTER_ROOT} \"${HUNTER_ROOT}\")\n"
  )
  # HUNTER_BASE can be set by testing
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_BASE \"${HUNTER_BASE}\")\n"
  )
  if(HUNTER_SHA1)
    file(
        APPEND
        "${HUNTER_DOWNLOAD_TOOLCHAIN}"
        "set(HUNTER_SHA1 \"${HUNTER_SHA1}\")\n"
    )
  endif()
  if(HUNTER_CONFIG_SHA1)
    file(
        APPEND
        "${HUNTER_DOWNLOAD_TOOLCHAIN}"
        "set(HUNTER_CONFIG_SHA1 \"${HUNTER_CONFIG_SHA1}\")\n"
    )
  else()
    hunter_internal_error("HUNTER_CONFIG_SHA1 empty")
  endif()

  # do not lock hunter directory if package is internal (already locked)
  file(APPEND "${HUNTER_DOWNLOAD_TOOLCHAIN}" "set(HUNTER_SKIP_LOCK YES)\n")

  # support for toolchain file forwarding
  if(CMAKE_TOOLCHAIN_FILE)
    # Fix windows path
    get_filename_component(x "${CMAKE_TOOLCHAIN_FILE}" ABSOLUTE)
    file(APPEND "${HUNTER_DOWNLOAD_TOOLCHAIN}" "include(\"${x}\")\n")
  endif()

  set(var_name "")
  foreach(fwd ${HUNTER_${h_name}_CMAKE_ARGS})
    string(FIND "${fwd}" "=" _hunter_update_var)
    if(_hunter_update_var EQUAL -1)
      # There is no '=' symbol - appending mode
      if(NOT var_name)
        hunter_internal_error("var_name empty")
      endif()
      set(var_value "${fwd}")
      file(
          APPEND
          "${HUNTER_DOWNLOAD_TOOLCHAIN}"
          "set(${var_name} "\${${var_name}}\;${var_value}" CACHE STRING \"\" FORCE)\n"
      )
      hunter_status_debug("Add extra CMake args: ${var_name} += ${var_value}")
    else()
      # Format <name>=<value>
      string(REGEX REPLACE "=.*" "" var_name "${fwd}")
      string(REGEX REPLACE ".*=" "" var_value "${fwd}")
      file(
          APPEND
          "${HUNTER_DOWNLOAD_TOOLCHAIN}"
          "set(${var_name} ${var_value} CACHE STRING \"\" FORCE)\n"
      )
      hunter_status_debug("Add extra CMake args: ${var_name} = ${var_value}")
    endif()
  endforeach()

  if(HUNTER_STATUS_DEBUG)
    set(verbose_makefile "-DCMAKE_VERBOSE_MAKEFILE=ON")
  endif()

  set(HUNTER_PACKAGE_INSTALL_DIR "${${h_root_name}}")
  set(HUNTER_PACKAGE_URL "${HUNTER_${h_name}_URL}")
  set(HUNTER_PACKAGE_SHA1 "${HUNTER_${h_name}_SHA1}")
  if(NOT HUNTER_PACKAGE_DOWNLOAD_DIR)
    set(HUNTER_PACKAGE_DOWNLOAD_DIR "${HUNTER_BASE}/Download/${h_name}")
  endif()
  set(HUNTER_PACKAGE_SOURCE_DIR "${HUNTER_BASE}/Source/${h_name}")

  if(NOT HUNTER_PACKAGE_URL)
    set(avail ${HUNTER_${h_name}_VERSIONS})
    hunter_internal_error(
        "${h_name} version(${ver}) not found. Available: [${avail}]"
    )
  endif()

  # print info before start generation/run
  hunter_status_debug("Add package: ${HUNTER_PACKAGE_NAME}")
  if(HUNTER_PACKAGE_COMPONENT)
    hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
  endif()
  hunter_status_debug("Install tag: ${HUNTER_INSTALL_TAG}")
  if(HUNTER_DOWNLOAD_SCHEME_VARIANTS)
    hunter_status_debug("Variants: [${HUNTER_DOWNLOAD_SCHEME_VARIANTS}]")
  endif()
  hunter_status_debug("Download scheme: ${HUNTER_DOWNLOAD_SCHEME}")
  hunter_status_debug("Url: ${HUNTER_PACKAGE_URL}")
  hunter_status_debug("SHA1: ${HUNTER_PACKAGE_SHA1}")

  set(
      download_scheme
      "${HUNTER_SELF}/cmake/schemes/${HUNTER_DOWNLOAD_SCHEME}.cmake.in"
  )
  if(NOT EXISTS "${download_scheme}")
    hunter_internal_error("Download scheme `${download_scheme}` not found")
  endif()

  # Remove configure step stamps and build directories.
  # Project that start configure may not exists already.
  hunter_find_stamps(
      NAME "configure"
      VARIANTS ${HUNTER_DOWNLOAD_SCHEME_VARIANTS}
      RESULT configure_list_stamps
  )

  foreach(stamp ${configure_list_stamps})
    if(NOT EXISTS "${stamp}")
      hunter_internal_error("Stamp not found")
    endif()
    file(REMOVE "${stamp}")
  endforeach()

  if(HUNTER_DOWNLOAD_SCHEME_VARIANTS)
    foreach(variant ${HUNTER_DOWNLOAD_SCHEME_VARIANTS})
      file(
          REMOVE_RECURSE
          "${HUNTER_BASE}/Build/${HUNTER_PACKAGE_BASENAME}-${variant}"
      )
    endforeach()
  else()
    file(REMOVE_RECURSE "${HUNTER_BASE}/Build/${HUNTER_PACKAGE_BASENAME}")
  endif()

  configure_file(
      "${download_scheme}"
      "${h_work_dir}/CMakeLists.txt"
      @ONLY
  )

  # support for custom cmake generators
  if(HUNTER_CMAKE_GENERATOR)
    set(HUNTER_DOWNLOAD_GENERATOR "-G${HUNTER_CMAKE_GENERATOR}")
  else()
    if(MSVC)
      # forward same generator for all project
      # because one generator = one compiler
      set(HUNTER_DOWNLOAD_GENERATOR "-G${CMAKE_GENERATOR}")
    else()
      # use default
      set(HUNTER_DOWNLOAD_GENERATOR)
    endif()
  endif()

  hunter_status_debug("Run generate")

  # Configure and build downloaded project
  execute_process(
      COMMAND
      "${CMAKE_COMMAND}"
      "-H${h_work_dir}"
      "-B${h_build_dir}"
      "-DCMAKE_TOOLCHAIN_FILE=${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "-DHUNTER_STATUS_DEBUG=${HUNTER_STATUS_DEBUG}"
      ${HUNTER_DOWNLOAD_GENERATOR}
      ${verbose_makefile}
      WORKING_DIRECTORY
      "${h_work_dir}"
      RESULT_VARIABLE
      h_generate_result
  )

  if(${h_generate_result} EQUAL 0)
    hunter_status_debug("Generate step successful (dir: ${h_work_dir})")
  else()
    hunter_unlock()
    hunter_internal_error("generate step failed (dir: ${h_work_dir})")
  endif()

  set(counter "")

  while(TRUE)
    hunter_status_print("Run build for package: ${HUNTER_PACKAGE_NAME}")

    execute_process(
        COMMAND
        "${CMAKE_COMMAND}" --build "${h_build_dir}"
        WORKING_DIRECTORY
        "${h_work_dir}"
        RESULT_VARIABLE
        h_build_result
    )

    if(${h_build_result} EQUAL 0)
      # Sanity check. Sometimes MSVC just skip build without any reason...
      hunter_check_already_installed(
          VARIANTS ${HUNTER_DOWNLOAD_SCHEME_VARIANTS}
          RESULT already_installed
      )
      if(NOT already_installed)
         hunter_unlock()
         hunter_fatal_error(
             "External project reported that build successfull"
             "but there are no stamps."
             WIKI "https://github.com/ruslo/hunter/wiki/Error-%28External-project-reported-that-build-successfull%29"
         )
      endif()
      hunter_status_print("Build step successful (dir: ${h_work_dir})")
      if(NOT HUNTER_STATUS_DEBUG)
        # clean-up
        file(REMOVE_RECURSE "${h_work_dir}")
      endif()

      hunter_unlock()
      return()
    else()
      set(counter "${counter}x")
      string(COMPARE EQUAL "${counter}" "xxxx" stop_condition)
      if(stop_condition)
        hunter_unlock()
        hunter_internal_error("build step failed (dir: ${h_work_dir}")
      else()
        string(TIMESTAMP time_now)
        hunter_status_print(
            "[${time_now}] Build failed, retry after 10 sec ..."
        )
        execute_process(COMMAND "${CMAKE_COMMAND}" -E sleep 10)
      endif()
    endif()
  endwhile()
endfunction()
