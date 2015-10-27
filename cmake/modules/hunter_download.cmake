# Copyright (c) 2013-2015, Ruslan Baratov, Aaditya Kalsi
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_create_args_file)
include(hunter_find_stamps)
include(hunter_internal_error)
include(hunter_jobs_number)
include(hunter_load_from_cache)
include(hunter_print_cmd)
include(hunter_register_dependency)
include(hunter_save_to_cache)
include(hunter_status_debug)
include(hunter_status_print)
include(hunter_test_string_not_empty)
include(hunter_user_error)

function(hunter_download)
  set(one PACKAGE_NAME PACKAGE_COMPONENT PACKAGE_INTERNAL_DEPS_ID)
  set(multiple PACKAGE_DEPENDS_ON)

  cmake_parse_arguments(HUNTER "" "${one}" "${multiple}" ${ARGV})
  # -> HUNTER_PACKAGE_NAME
  # -> HUNTER_PACKAGE_COMPONENT
  # -> HUNTER_PACKAGE_DEPENDS_ON
  # -> HUNTER_PACKAGE_INTERNAL_DEPS_ID

  if(HUNTER_UNPARSED_ARGUMENTS)
    hunter_internal_error("Unparsed: ${HUNTER_UNPARSED_ARGUMENTS}")
  endif()

  set(versions "[${HUNTER_${HUNTER_PACKAGE_NAME}_VERSIONS}]")
  hunter_status_debug(
      "${HUNTER_PACKAGE_NAME} versions available: ${versions}"
  )

  hunter_test_string_not_empty("${HUNTER_DOWNLOAD_SCHEME}")
  hunter_test_string_not_empty("${HUNTER_SELF}")

  hunter_test_string_not_empty("${HUNTER_INSTALL_PREFIX}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${HUNTER_TOOLCHAIN_ID_PATH}")
  hunter_test_string_not_empty("${HUNTER_CACHE_FILE}")

  string(COMPARE NOTEQUAL "${HUNTER_BINARY_DIR}" "" hunter_has_binary_dir)
  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" hunter_has_component)
  string(COMPARE NOTEQUAL "${CMAKE_TOOLCHAIN_FILE}" "" hunter_has_toolchain)
  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_PACKAGE_INTERNAL_DEPS_ID}"
      ""
      has_internal_deps_id
  )

  if(hunter_has_component)
    set(HUNTER_EP_NAME "${HUNTER_PACKAGE_NAME}-${HUNTER_PACKAGE_COMPONENT}")
  else()
    set(HUNTER_EP_NAME "${HUNTER_PACKAGE_NAME}")
  endif()

  # Set <LIB>_ROOT variables
  set(h_name "${HUNTER_PACKAGE_NAME}") # Foo
  string(TOUPPER "${HUNTER_PACKAGE_NAME}" root_name) # FOO
  set(root_name "${root_name}_ROOT") # FOO_ROOT

  set(HUNTER_PACKAGE_VERSION "${HUNTER_${h_name}_VERSION}")
  set(ver "${HUNTER_PACKAGE_VERSION}")
  set(HUNTER_PACKAGE_URL "${HUNTER_${h_name}_URL}")
  set(HUNTER_PACKAGE_SHA1 "${HUNTER_${h_name}_SHA1}")
  set(
      HUNTER_PACKAGE_CONFIGURATION_TYPES
      "${HUNTER_${h_name}_CONFIGURATION_TYPES}"
  )
  string(COMPARE EQUAL "${HUNTER_PACKAGE_CONFIGURATION_TYPES}" "" no_types)
  if(no_types)
    set(HUNTER_PACKAGE_CONFIGURATION_TYPES ${HUNTER_CACHED_CONFIGURATION_TYPES})
  endif()

  set(HUNTER_PACKAGE_CACHEABLE "${HUNTER_${h_name}_CACHEABLE}")

  hunter_test_string_not_empty("${HUNTER_PACKAGE_CONFIGURATION_TYPES}")

  string(COMPARE EQUAL "${HUNTER_PACKAGE_URL}" "" hunter_no_url)

  string(COMPARE EQUAL "${HUNTER_PACKAGE_SHA1}" "" version_not_found)
  if(version_not_found)
    hunter_user_error("Version not found: ${ver}. See 'hunter_config' command.")
  endif()

  hunter_test_string_not_empty("${HUNTER_PACKAGE_URL}")
  hunter_test_string_not_empty("${HUNTER_PACKAGE_SHA1}")

  hunter_make_directory(
      "${HUNTER_CACHED_ROOT}/_Base/Download/${HUNTER_PACKAGE_NAME}/${ver}"
      "${HUNTER_PACKAGE_SHA1}"
      HUNTER_PACKAGE_DOWNLOAD_DIR
  )


  # Check that only one scheme is set to 1
  set(all_schemes "")
  set(all_schemes "${all_schemes}${HUNTER_PACKAGE_SCHEME_DOWNLOAD}")
  set(all_schemes "${all_schemes}${HUNTER_PACKAGE_SCHEME_UNPACK}")
  set(all_schemes "${all_schemes}${HUNTER_PACKAGE_SCHEME_INSTALL}")

  string(COMPARE EQUAL "${all_schemes}" "1" is_good)
  if(NOT is_good)
    hunter_internal_error(
        "Incorrect schemes:"
        "  HUNTER_PACKAGE_SCHEME_DOWNLOAD = ${HUNTER_PACKAGE_SCHEME_DOWNLOAD}"
        "  HUNTER_PACKAGE_SCHEME_UNPACK = ${HUNTER_PACKAGE_SCHEME_UNPACK}"
        "  HUNTER_PACKAGE_SCHEME_INSTALL = ${HUNTER_PACKAGE_SCHEME_INSTALL}"
    )
  endif()

  # Set:
  #   * HUNTER_PACKAGE_SOURCE_DIR
  #   * HUNTER_PACKAGE_DONE_STAMP
  #   * HUNTER_PACKAGE_BUILD_DIR
  #   * HUNTER_PACKAGE_HOME_DIR
  set(HUNTER_PACKAGE_HOME_DIR "${HUNTER_TOOLCHAIN_ID_PATH}/Build")
  set(
      HUNTER_PACKAGE_HOME_DIR
      "${HUNTER_PACKAGE_HOME_DIR}/${HUNTER_PACKAGE_NAME}"
  )
  if(hunter_has_component)
    set(
        HUNTER_PACKAGE_HOME_DIR
        "${HUNTER_PACKAGE_HOME_DIR}/__${HUNTER_PACKAGE_COMPONENT}"
    )
  endif()
  set(HUNTER_PACKAGE_DONE_STAMP "${HUNTER_PACKAGE_HOME_DIR}/DONE")
  if(hunter_has_binary_dir)
    set(
        HUNTER_PACKAGE_BUILD_DIR
        "${HUNTER_BINARY_DIR}/${HUNTER_PACKAGE_NAME}"
    )
    if(hunter_has_component)
      set(
          HUNTER_PACKAGE_BUILD_DIR
          "${HUNTER_PACKAGE_BUILD_DIR}/__${HUNTER_PACKAGE_COMPONENT}"
      )
    endif()
  else()
    set(HUNTER_PACKAGE_BUILD_DIR "${HUNTER_PACKAGE_HOME_DIR}/Build")
  endif()
  set(HUNTER_PACKAGE_SOURCE_DIR "${HUNTER_PACKAGE_HOME_DIR}/Source")

  if(HUNTER_PACKAGE_CACHEABLE)
    if(NOT HUNTER_PACKAGE_SCHEME_INSTALL)
      hunter_internal_error("Non-install packages is cacheable by default")
    endif()
    set(HUNTER_PACKAGE_INSTALL_PREFIX "${HUNTER_PACKAGE_HOME_DIR}/Install")
  else()
    set(HUNTER_PACKAGE_INSTALL_PREFIX "${HUNTER_INSTALL_PREFIX}")
  endif()

  if(HUNTER_PACKAGE_SCHEME_INSTALL)
    set(${root_name} "${HUNTER_INSTALL_PREFIX}")
    hunter_status_debug("Install to: ${HUNTER_INSTALL_PREFIX}")
  else()
    if(hunter_has_component)
      hunter_internal_error(
          "Component for non-install package:"
          " ${HUNTER_PACKAGE_NAME} ${HUNTER_PACKAGE_COMPONENT}"
      )
    endif()
    if(HUNTER_PACKAGE_SCHEME_DOWNLOAD)
      set(${root_name} "${HUNTER_PACKAGE_SOURCE_DIR}")
      hunter_status_debug("Download to: ${HUNTER_PACKAGE_SOURCE_DIR}")
    elseif(HUNTER_PACKAGE_SCHEME_UNPACK)
      set(${root_name} "${HUNTER_PACKAGE_SOURCE_DIR}")
      hunter_status_debug("Unpack to: ${HUNTER_PACKAGE_SOURCE_DIR}")
    else()
      hunter_internal_error("Invalid scheme")
    endif()
  endif()

  # license file variable
  set(HUNTER_PACKAGE_LICENSE_FILE "${HUNTER_PACKAGE_INSTALL_PREFIX}/licenses/${HUNTER_PACKAGE_NAME}/LICENSE")
  set(license_var "${HUNTER_PACKAGE_NAME}_LICENSE")
  set(license_val "${HUNTER_INSTALL_PREFIX}/licenses/${HUNTER_PACKAGE_NAME}/LICENSE")

  set(${root_name} "${${root_name}}" PARENT_SCOPE)
  set(ENV{${root_name}} "${${root_name}}")
  hunter_status_print("${root_name}: ${${root_name}} (ver.: ${ver})")

  # Same for the "snake case"
  string(REPLACE "-" "_" snake_case_root_name "${root_name}")
  set(${snake_case_root_name} "${${root_name}}" PARENT_SCOPE)
  set(ENV{${snake_case_root_name}} "${${root_name}}")

  set(${license_var} ${license_val} PARENT_SCOPE)

  # temp toolchain file to set variables and include real toolchain
  set(HUNTER_DOWNLOAD_TOOLCHAIN "${HUNTER_PACKAGE_HOME_DIR}/toolchain.cmake")

  # separate file with build options
  set(HUNTER_ARGS_FILE "${HUNTER_PACKAGE_HOME_DIR}/args.cmake")

  # Registering dependency (before return!)
  hunter_register_dependency(
      PACKAGE "${HUNTER_PARENT_PACKAGE}"
      DEPENDS_ON_PACKAGE "${HUNTER_PACKAGE_NAME}"
      DEPENDS_ON_COMPONENT "${HUNTER_PACKAGE_COMPONENT}"
  )

  foreach(deps ${HUNTER_PACKAGE_DEPENDS_ON})
    if(NOT HUNTER_PACKAGE_SCHEME_INSTALL)
      hunter_internal_error("Non-install scheme can't depends on anything")
    endif()
    # Register explicit dependency
    hunter_register_dependency(
        PACKAGE "${HUNTER_PACKAGE_NAME};${HUNTER_PACKAGE_COMPONENT}"
        DEPENDS_ON_PACKAGE "${deps}"
    )
  endforeach()

  if(EXISTS "${HUNTER_PACKAGE_DONE_STAMP}")
    hunter_status_debug("Package already installed: ${HUNTER_PACKAGE_NAME}")
    if(hunter_has_component)
      hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
    endif()
    return()
  endif()

  hunter_lock_directory(
      "${HUNTER_PACKAGE_DOWNLOAD_DIR}" HUNTER_ALREADY_LOCKED_DIRECTORIES
  )
  hunter_lock_directory(
      "${HUNTER_TOOLCHAIN_ID_PATH}" HUNTER_ALREADY_LOCKED_DIRECTORIES
  )
  if(hunter_has_binary_dir)
    hunter_lock_directory(
        "${HUNTER_BINARY_DIR}" HUNTER_ALREADY_LOCKED_DIRECTORIES
    )
  endif()

  # While locking other instance can finish package building
  if(EXISTS "${HUNTER_PACKAGE_DONE_STAMP}")
    hunter_status_debug("Package already installed: ${HUNTER_PACKAGE_NAME}")
    if(hunter_has_component)
      hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
    endif()
    return()
  endif()

  # load from cache using SHA1 of args.cmake file
  file(REMOVE "${HUNTER_ARGS_FILE}")
  hunter_create_args_file(
      "${HUNTER_${h_name}_CMAKE_ARGS}" "${HUNTER_ARGS_FILE}"
  )

  # Check if package can be loaded from cache
  hunter_load_from_cache()

  if(HUNTER_CACHE_RUN)
    return()
  endif()

  if(EXISTS "${HUNTER_PACKAGE_DONE_STAMP}")
    hunter_status_debug("Package installed from cache: ${HUNTER_PACKAGE_NAME}")
    if(hunter_has_component)
      hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
    endif()
    return()
  endif()

  file(REMOVE_RECURSE "${HUNTER_PACKAGE_BUILD_DIR}")
  file(REMOVE "${HUNTER_PACKAGE_HOME_DIR}/CMakeLists.txt")
  file(REMOVE "${HUNTER_DOWNLOAD_TOOLCHAIN}")

  file(WRITE "${HUNTER_DOWNLOAD_TOOLCHAIN}" "")

  hunter_jobs_number(HUNTER_JOBS_OPTION "${HUNTER_DOWNLOAD_TOOLCHAIN}")
  hunter_status_debug("HUNTER_JOBS_NUMBER: ${HUNTER_JOBS_NUMBER}")
  hunter_status_debug("HUNTER_JOBS_OPTION: ${HUNTER_JOBS_OPTION}")

  # support for toolchain file forwarding
  if(hunter_has_toolchain)
    # Fix windows path
    get_filename_component(x "${CMAKE_TOOLCHAIN_FILE}" ABSOLUTE)
    file(APPEND "${HUNTER_DOWNLOAD_TOOLCHAIN}" "include(\"${x}\")\n")
  endif()

  # After toolchain! (toolchain may already have this variables)
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_PARENT_PACKAGE \"${HUNTER_PACKAGE_NAME};${HUNTER_PACKAGE_COMPONENT}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_ALREADY_LOCKED_DIRECTORIES \"${HUNTER_ALREADY_LOCKED_DIRECTORIES}\" CACHE INTERNAL \"\")\n"
  )


  if(hunter_no_url)
    set(avail ${HUNTER_${h_name}_VERSIONS})
    hunter_internal_error(
        "${h_name} version(${ver}) not found. Available: [${avail}]"
    )
  endif()

  # print info before start generation/run
  hunter_status_debug("Add package: ${HUNTER_PACKAGE_NAME}")
  if(hunter_has_component)
    hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
  endif()
  hunter_status_debug("Download scheme: ${HUNTER_DOWNLOAD_SCHEME}")
  hunter_status_debug("Url: ${HUNTER_PACKAGE_URL}")
  hunter_status_debug("SHA1: ${HUNTER_PACKAGE_SHA1}")
  if(HUNTER_PACKAGE_SCHEME_INSTALL)
    hunter_status_debug(
        "Configuration types: ${HUNTER_PACKAGE_CONFIGURATION_TYPES}"
    )
  endif()

  if(has_internal_deps_id)
    hunter_status_debug(
        "Internal dependencies ID: ${HUNTER_PACKAGE_INTERNAL_DEPS_ID}"
    )
  endif()

  set(
      download_scheme
      "${HUNTER_SELF}/cmake/schemes/${HUNTER_DOWNLOAD_SCHEME}.cmake.in"
  )
  if(NOT EXISTS "${download_scheme}")
    hunter_internal_error("Download scheme `${download_scheme}` not found")
  endif()

  configure_file(
      "${download_scheme}"
      "${HUNTER_PACKAGE_HOME_DIR}/CMakeLists.txt"
      @ONLY
  )

  set(build_message "Building ${HUNTER_PACKAGE_NAME}")
  if(hunter_has_component)
    set(
        build_message
        "${build_message} (component: ${HUNTER_PACKAGE_COMPONENT})"
    )
  endif()
  hunter_status_print("${build_message}")

  if(HUNTER_STATUS_DEBUG)
    set(logging_params "")
  elseif(HUNTER_STATUS_PRINT)
    set(logging_params "")
  else()
    set(logging_params "OUTPUT_QUIET")
  endif()

  set(
      cmd
      "${CMAKE_COMMAND}"
      "-C${HUNTER_CACHE_FILE}"
      "-C${HUNTER_ARGS_FILE}" # After cache (high priority for user's variable)
      "-H${HUNTER_PACKAGE_HOME_DIR}"
      "-B${HUNTER_PACKAGE_BUILD_DIR}"
      "-DCMAKE_TOOLCHAIN_FILE=${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "-G${CMAKE_GENERATOR}"
  )
  hunter_print_cmd("${HUNTER_PACKAGE_HOME_DIR}" "${cmd}")

  # Configure and build downloaded project
  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${HUNTER_PACKAGE_HOME_DIR}"
      RESULT_VARIABLE generate_result
      ${logging_params}
  )

  if(generate_result EQUAL 0)
    hunter_status_debug(
        "Configure step successful (dir: ${HUNTER_PACKAGE_HOME_DIR})"
    )
  else()
    hunter_fatal_error(
        "Configure step failed (dir: ${HUNTER_PACKAGE_HOME_DIR})"
        WIKI "error.external.build.failed"
    )
  endif()

  set(
      cmd
      "${CMAKE_COMMAND}"
      --build
      "${HUNTER_PACKAGE_BUILD_DIR}"
  )
  hunter_print_cmd("${HUNTER_PACKAGE_HOME_DIR}" "${cmd}")

  execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY "${HUNTER_PACKAGE_HOME_DIR}"
      RESULT_VARIABLE build_result
      ${logging_params}
  )

  if(build_result EQUAL 0)
    hunter_status_print(
        "Build step successful (dir: ${HUNTER_PACKAGE_HOME_DIR})"
    )
  else()
    hunter_fatal_error(
        "Build step failed (dir: ${HUNTER_PACKAGE_HOME_DIR}"
        WIKI "error.external.build.failed"
    )
  endif()

  if(HUNTER_PACKAGE_SCHEME_DOWNLOAD)
    # This scheme not using ExternalProject_Add so there will be no stamps
  else()
    hunter_find_stamps("${HUNTER_PACKAGE_BUILD_DIR}")
  endif()

  hunter_save_to_cache()

  hunter_status_debug("Cleaning up build directories...")

  file(REMOVE_RECURSE "${HUNTER_PACKAGE_BUILD_DIR}")
  if(HUNTER_PACKAGE_SCHEME_INSTALL)
    # Unpacked directory not needed (save some disk space)
    file(REMOVE_RECURSE "${HUNTER_PACKAGE_SOURCE_DIR}")
  endif()

  file(REMOVE "${HUNTER_PACKAGE_HOME_DIR}/CMakeLists.txt")
  file(REMOVE "${HUNTER_DOWNLOAD_TOOLCHAIN}")
  file(REMOVE "${HUNTER_ARGS_FILE}")

  if(HUNTER_PACKAGE_CACHEABLE)
    file(REMOVE_RECURSE "${HUNTER_PACKAGE_INSTALL_PREFIX}")
  endif()

  file(WRITE "${HUNTER_PACKAGE_DONE_STAMP}" "")
endfunction()
