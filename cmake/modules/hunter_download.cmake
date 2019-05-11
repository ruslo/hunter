# Copyright (c) 2013-2018, Ruslan Baratov
# Copyright (c) 2015-2018, Aaditya Kalsi
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_assert_empty_string)
include(hunter_assert_not_empty_string)
include(hunter_create_args_file)
include(hunter_find_licenses)
include(hunter_find_stamps)
include(hunter_get_cacheable)
include(hunter_get_cmake_args)
include(hunter_get_configuration_types)
include(hunter_get_keep_package_sources)
include(hunter_get_package_sha1)
include(hunter_get_package_url)
include(hunter_internal_error)
include(hunter_jobs_number)
include(hunter_load_from_cache)
include(hunter_print_cmd)
include(hunter_read_http_credentials)
include(hunter_register_dependency)
include(hunter_save_to_cache)
include(hunter_status_debug)
include(hunter_status_print)
include(hunter_upload_cache)
include(hunter_user_error)

# Note: 'hunter_find_licenses' should be called before each return point
function(hunter_download)
  set(one PACKAGE_NAME PACKAGE_COMPONENT PACKAGE_INTERNAL_DEPS_ID)
  set(multiple PACKAGE_UNRELOCATABLE_TEXT_FILES)

  cmake_parse_arguments(HUNTER "" "${one}" "${multiple}" ${ARGV})
  # -> HUNTER_PACKAGE_NAME
  # -> HUNTER_PACKAGE_COMPONENT
  # -> HUNTER_PACKAGE_INTERNAL_DEPS_ID
  # -> HUNTER_PACKAGE_UNRELOCATABLE_TEXT_FILES

  hunter_assert_empty_string("${HUNTER_UNPARSED_ARGUMENTS}")

  set(versions "[${HUNTER_${HUNTER_PACKAGE_NAME}_VERSIONS}]")
  hunter_status_debug(
      "${HUNTER_PACKAGE_NAME} versions available: ${versions}"
  )

  hunter_assert_not_empty_string("${HUNTER_DOWNLOAD_SCHEME}")
  hunter_assert_not_empty_string("${HUNTER_SELF}")

  hunter_assert_not_empty_string("${HUNTER_INSTALL_PREFIX}")
  hunter_assert_not_empty_string("${HUNTER_PACKAGE_NAME}")
  hunter_assert_not_empty_string("${HUNTER_CONFIG_ID_PATH}")
  hunter_assert_not_empty_string("${HUNTER_CACHE_FILE}")

  string(COMPARE NOTEQUAL "${HUNTER_BINARY_DIR}" "" has_binary_dir)
  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" has_component)
  string(COMPARE NOTEQUAL "${CMAKE_TOOLCHAIN_FILE}" "" has_toolchain)
  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_PACKAGE_INTERNAL_DEPS_ID}"
      ""
      has_internal_deps_id
  )

  if(has_component)
    set(HUNTER_EP_NAME "${HUNTER_PACKAGE_NAME}-${HUNTER_PACKAGE_COMPONENT}")
  else()
    set(HUNTER_EP_NAME "${HUNTER_PACKAGE_NAME}")
  endif()

  # Set <LIB>_ROOT variables
  set(package "${HUNTER_PACKAGE_NAME}") # Foo
  string(TOUPPER "${HUNTER_PACKAGE_NAME}" root_name) # FOO
  set(root_name "${root_name}_ROOT") # FOO_ROOT

  set(HUNTER_PACKAGE_VERSION "${HUNTER_${package}_VERSION}")
  set(ver "${HUNTER_PACKAGE_VERSION}")

  hunter_get_package_sha1(
      PACKAGE "${package}"
      VERSION "${ver}"
      AVAILABLE_VERSIONS "${HUNTER_${package}_VERSIONS}"
      OUT HUNTER_PACKAGE_SHA1
  )

  hunter_get_package_url(
      PACKAGE "${package}"
      VERSION "${ver}"
      SHA1 "${HUNTER_PACKAGE_SHA1}"
      OUT HUNTER_PACKAGE_URL
  )

  hunter_get_configuration_types(
      PACKAGE "${package}"
      OUT HUNTER_PACKAGE_CONFIGURATION_TYPES
  )

  hunter_get_cacheable(
      PACKAGE "${package}"
      UNRELOCATABLE "${HUNTER_PACKAGE_UNRELOCATABLE_TEXT_FILES}"
      OUT HUNTER_PACKAGE_CACHEABLE
  )

  set(HUNTER_PACKAGE_PROTECTED_SOURCES "${HUNTER_${package}_PROTECTED_SOURCES}")

  hunter_assert_not_empty_string("${HUNTER_PACKAGE_URL}")
  hunter_assert_not_empty_string("${HUNTER_PACKAGE_SHA1}")

  hunter_make_directory(
      "${HUNTER_CACHED_ROOT}/_Base/Download/${HUNTER_PACKAGE_NAME}/${ver}"
      "${HUNTER_PACKAGE_SHA1}"
      HUNTER_PACKAGE_DOWNLOAD_DIR
  )

  # Check that only one scheme is set to 1
  set(all_schemes "")
  set(all_schemes "${all_schemes}${HUNTER_PACKAGE_SCHEME_DOWNLOAD}")
  set(all_schemes "${all_schemes}${HUNTER_PACKAGE_SCHEME_UNPACK}")
  set(all_schemes "${all_schemes}${HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL}")
  set(all_schemes "${all_schemes}${HUNTER_PACKAGE_SCHEME_INSTALL}")

  string(COMPARE EQUAL "${all_schemes}" "1" is_good)
  if(NOT is_good)
    hunter_internal_error(
        "Incorrect schemes:"
        "  HUNTER_PACKAGE_SCHEME_DOWNLOAD = ${HUNTER_PACKAGE_SCHEME_DOWNLOAD}"
        "  HUNTER_PACKAGE_SCHEME_UNPACK = ${HUNTER_PACKAGE_SCHEME_UNPACK}"
        "  HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL = ${HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL}"
        "  HUNTER_PACKAGE_SCHEME_INSTALL = ${HUNTER_PACKAGE_SCHEME_INSTALL}"
    )
  endif()

  # Set:
  #   * HUNTER_PACKAGE_SETUP_DIR
  #   * HUNTER_GLOBAL_SCRIPT_DIR
  #   * HUNTER_PACKAGE_SCRIPT_DIR
  #   * HUNTER_PACKAGE_SOURCE_DIR
  #   * HUNTER_PACKAGE_DONE_STAMP
  #   * HUNTER_PACKAGE_BUILD_DIR
  #   * HUNTER_PACKAGE_HOME_DIR
  set(HUNTER_PACKAGE_SETUP_DIR "${HUNTER_SELF}/cmake/projects/${HUNTER_PACKAGE_NAME}")
  set(HUNTER_GLOBAL_SCRIPT_DIR "${HUNTER_SELF}/scripts")
  set(HUNTER_PACKAGE_SCRIPT_DIR "${HUNTER_PACKAGE_SETUP_DIR}/scripts/")
  set(HUNTER_PACKAGE_HOME_DIR "${HUNTER_CONFIG_ID_PATH}/Build")
  set(
      HUNTER_PACKAGE_HOME_DIR
      "${HUNTER_PACKAGE_HOME_DIR}/${HUNTER_PACKAGE_NAME}"
  )
  if(has_component)
    set(
        HUNTER_PACKAGE_HOME_DIR
        "${HUNTER_PACKAGE_HOME_DIR}/__${HUNTER_PACKAGE_COMPONENT}"
    )
  endif()
  if(has_binary_dir)
    # When cross-compiling we may need two build directories for
    # the package - one for host and one for target. To avoid conflicts
    # add random string.
    string(RANDOM random)
    set(helper_dir_to_remove "${HUNTER_BINARY_DIR}/${random}")
    set(
        HUNTER_PACKAGE_BUILD_DIR
        "${helper_dir_to_remove}/${HUNTER_PACKAGE_NAME}"
    )
    if(has_component)
      set(
          HUNTER_PACKAGE_BUILD_DIR
          "${HUNTER_PACKAGE_BUILD_DIR}/__${HUNTER_PACKAGE_COMPONENT}"
      )
    endif()
    if(EXISTS ${HUNTER_PACKAGE_BUILD_DIR})
      hunter_internal_error("Not so random...")
    endif()
  else()
    set(HUNTER_PACKAGE_BUILD_DIR "${HUNTER_PACKAGE_HOME_DIR}/Build")
    set(helper_dir_to_remove "${HUNTER_PACKAGE_BUILD_DIR}")
  endif()

  if(HUNTER_PACKAGE_CACHEABLE)
    if(NOT HUNTER_PACKAGE_SCHEME_INSTALL)
      hunter_internal_error("Non-install packages is cacheable by default")
    endif()
    set(HUNTER_PACKAGE_INSTALL_PREFIX "${HUNTER_PACKAGE_HOME_DIR}/Install")
  else()
    set(HUNTER_PACKAGE_INSTALL_PREFIX "${HUNTER_INSTALL_PREFIX}")
  endif()

  if(HUNTER_PACKAGE_SCHEME_UNPACK)
    string(SUBSTRING "${HUNTER_PACKAGE_SHA1}" 0 7 x)
    set(hunter_lock_sources TRUE)
    set(
        hunter_lock_sources_dir
        "${HUNTER_CACHED_ROOT}/_Base/Cellar/${HUNTER_PACKAGE_SHA1}/${x}"
    )
    set(HUNTER_PACKAGE_SOURCE_DIR "${hunter_lock_sources_dir}/raw")
    set(HUNTER_PACKAGE_DONE_STAMP "${hunter_lock_sources_dir}/unpack.DONE")
    set(HUNTER_PACKAGE_LICENSE_DIR "${hunter_lock_sources_dir}/licenses")
    set(HUNTER_PACKAGE_LICENSE_SEARCH_DIR "${HUNTER_PACKAGE_LICENSE_DIR}")
  else()
    set(hunter_lock_sources FALSE)
    set(HUNTER_PACKAGE_SOURCE_DIR "${HUNTER_PACKAGE_HOME_DIR}/Source")
    set(HUNTER_PACKAGE_DONE_STAMP "${HUNTER_PACKAGE_HOME_DIR}/DONE")
    set(HUNTER_PACKAGE_LICENSE_DIR "${HUNTER_PACKAGE_INSTALL_PREFIX}/licenses/${HUNTER_PACKAGE_NAME}")
    set(HUNTER_PACKAGE_LICENSE_SEARCH_DIR "${HUNTER_INSTALL_PREFIX}/licenses/${HUNTER_PACKAGE_NAME}")
  endif()

  if(HUNTER_PACKAGE_SCHEME_INSTALL)
    set(${root_name} "${HUNTER_INSTALL_PREFIX}")
    hunter_status_debug("Install to: ${HUNTER_INSTALL_PREFIX}")
  else()
    if(has_component)
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
    elseif(HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL)
      set(${root_name} "${HUNTER_INSTALL_PREFIX}")
      hunter_status_debug("Install to: ${HUNTER_PACKAGE_SOURCE_DIR}")
    else()
      hunter_internal_error("Invalid scheme")
    endif()
  endif()

  set(${root_name} "${${root_name}}" PARENT_SCOPE)
  set(ENV{${root_name}} "${${root_name}}")
  hunter_status_print("${root_name}: ${${root_name}} (ver.: ${ver})")

  # Same for the "snake case"
  string(REPLACE "-" "_" snake_case_root_name "${root_name}")
  set(${snake_case_root_name} "${${root_name}}" PARENT_SCOPE)
  set(ENV{${snake_case_root_name}} "${${root_name}}")

  # temp toolchain file to set variables and include real toolchain
  set(HUNTER_DOWNLOAD_TOOLCHAIN "${HUNTER_PACKAGE_HOME_DIR}/toolchain.cmake")

  # separate file with build options
  set(HUNTER_ARGS_FILE "${HUNTER_PACKAGE_HOME_DIR}/args.cmake")

  # Registering dependency (before return!)
  # Note: there will be no dependency registration on cache run.
  # HUNTER_PARENT_PACKAGE set to empty string in 'hunter_cache_run'
  hunter_register_dependency(
      PACKAGE "${HUNTER_PARENT_PACKAGE}"
      DEPENDS_ON_PACKAGE "${HUNTER_PACKAGE_NAME}"
      DEPENDS_ON_COMPONENT "${HUNTER_PACKAGE_COMPONENT}"
  )

  if(EXISTS "${HUNTER_PACKAGE_DONE_STAMP}")
    hunter_status_debug("Package already installed: ${HUNTER_PACKAGE_NAME}")
    if(has_component)
      hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
    endif()

    # In:
    # * HUNTER_PACKAGE_HOME_DIR
    # * HUNTER_PACKAGE_LICENSE_SEARCH_DIR
    # * HUNTER_PACKAGE_NAME
    # * HUNTER_PACKAGE_SCHEME_UNPACK
    # * HUNTER_PACKAGE_SHA1
    # Out:
    # * ${HUNTER_PACKAGE_NAME}_LICENSES (parent scope)
    hunter_find_licenses()

    return()
  endif()

  # Root should be locked first:
  # - https://github.com/ruslo/hunter/issues/1806
  # - https://github.com/forexample/deadlock-test
  hunter_lock_directory(
      "${HUNTER_CONFIG_ID_PATH}" HUNTER_ALREADY_LOCKED_DIRECTORIES
  )
  hunter_lock_directory(
      "${HUNTER_PACKAGE_DOWNLOAD_DIR}" HUNTER_ALREADY_LOCKED_DIRECTORIES
  )
  if(hunter_lock_sources)
    hunter_lock_directory(
        "${hunter_lock_sources_dir}" HUNTER_ALREADY_LOCKED_DIRECTORIES
    )
  endif()

  # While locking other instance can finish package building
  if(EXISTS "${HUNTER_PACKAGE_DONE_STAMP}")
    hunter_status_debug("Package already installed: ${HUNTER_PACKAGE_NAME}")
    if(has_component)
      hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
    endif()

    # In:
    # * HUNTER_PACKAGE_HOME_DIR
    # * HUNTER_PACKAGE_LICENSE_SEARCH_DIR
    # * HUNTER_PACKAGE_NAME
    # * HUNTER_PACKAGE_SCHEME_UNPACK
    # * HUNTER_PACKAGE_SHA1
    # Out:
    # * ${HUNTER_PACKAGE_NAME}_LICENSES (parent scope)
    hunter_find_licenses()

    return()
  endif()

  hunter_get_cmake_args(PACKAGE "${package}" OUT package_cmake_args)

  file(REMOVE "${HUNTER_ARGS_FILE}")
  hunter_create_args_file("${package_cmake_args}" "${HUNTER_ARGS_FILE}")

  # Pass the raw list of arguments to build scheme:
  # * https://github.com/ruslo/hunter/blob/v0.23.18/cmake/projects/Boost/schemes/url_sha1_boost.cmake.in#L95-L100
  # * https://github.com/ruslo/hunter/issues/1525
  set(HUNTER_${HUNTER_PACKAGE_NAME}_CMAKE_ARGS "${package_cmake_args}")

  # Check if package can be loaded from cache
  hunter_load_from_cache()

  if(HUNTER_CACHE_RUN)
    # No need for licenses here (no 'hunter_find_licenses' call)
    return()
  endif()

  if(HUNTER_PACKAGE_SCHEME_UNPACK AND HUNTER_SKIP_SCHEME_UNPACK)
    # We don't need sources if parent is available in cache
    hunter_status_debug("Skip unpacking of ${HUNTER_PACKAGE_NAME}")
    return()
  endif()

  if(EXISTS "${HUNTER_PACKAGE_DONE_STAMP}")
    hunter_status_debug("Package installed from cache: ${HUNTER_PACKAGE_NAME}")
    if(has_component)
      hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
    endif()

    # In:
    # * HUNTER_PACKAGE_HOME_DIR
    # * HUNTER_PACKAGE_LICENSE_SEARCH_DIR
    # * HUNTER_PACKAGE_NAME
    # * HUNTER_PACKAGE_SCHEME_UNPACK
    # * HUNTER_PACKAGE_SHA1
    # Out:
    # * ${HUNTER_PACKAGE_NAME}_LICENSES (parent scope)
    hunter_find_licenses()

    return()
  endif()

  if(HUNTER_PACKAGE_PROTECTED_SOURCES)
    # -> HUNTER_PACKAGE_HTTP_USERNAME
    # -> HUNTER_PACKAGE_HTTP_PASSWORD
    hunter_read_http_credentials()

    string(COMPARE EQUAL "${HUNTER_PACKAGE_HTTP_USERNAME}" "" name_is_empty)
    string(COMPARE EQUAL "${HUNTER_PACKAGE_HTTP_PASSWORD}" "" pass_is_empty)

    if(name_is_empty OR pass_is_empty)
      hunter_user_error(
          "Credentials for '${HUNTER_PACKAGE_NAME}' are not defined"
      )
    endif()
  endif()

  file(REMOVE_RECURSE "${HUNTER_PACKAGE_BUILD_DIR}")
  file(REMOVE "${HUNTER_PACKAGE_HOME_DIR}/CMakeLists.txt")
  file(REMOVE "${HUNTER_DOWNLOAD_TOOLCHAIN}")

  hunter_get_keep_package_sources(PACKAGE "${package}" OUT keep_sources)

  file(WRITE "${HUNTER_DOWNLOAD_TOOLCHAIN}" "")

  hunter_jobs_number(HUNTER_JOBS_OPTION "${HUNTER_DOWNLOAD_TOOLCHAIN}")
  hunter_status_debug("HUNTER_JOBS_NUMBER: ${HUNTER_JOBS_NUMBER}")
  hunter_status_debug("HUNTER_JOBS_NUMBER (env): $ENV{HUNTER_JOBS_NUMBER}")
  hunter_status_debug("HUNTER_JOBS_OPTION: ${HUNTER_JOBS_OPTION}")

  # support for toolchain file forwarding
  if(has_toolchain)
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
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_DISABLE_BUILDS \"${HUNTER_DISABLE_BUILDS}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_USE_CACHE_SERVERS \"${HUNTER_USE_CACHE_SERVERS}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_CACHE_SERVERS \"${HUNTER_CACHE_SERVERS}\" CACHE INTERNAL \"\")\n"
  )
  string(COMPARE NOTEQUAL "${HUNTER_PASSWORDS_PATH}" "" has_passwords)
  if(has_passwords)
    # Fix Windows slashes
    get_filename_component(
        passwords_path "${HUNTER_PASSWORDS_PATH}" ABSOLUTE
    )
    file(
        APPEND
        "${HUNTER_DOWNLOAD_TOOLCHAIN}"
        "set(HUNTER_PASSWORDS_PATH \"${passwords_path}\" CACHE INTERNAL \"\")\n"
    )
  endif()
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_KEEP_PACKAGE_SOURCES \"${HUNTER_KEEP_PACKAGE_SOURCES}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_SUPPRESS_LIST_OF_FILES \"${HUNTER_SUPPRESS_LIST_OF_FILES}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_DOWNLOAD_SERVER \"${HUNTER_DOWNLOAD_SERVER}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_TLS_VERIFY \"${HUNTER_TLS_VERIFY}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_RUN_UPLOAD \"${HUNTER_RUN_UPLOAD}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_JOBS_NUMBER \"${HUNTER_JOBS_NUMBER}\" CACHE INTERNAL \"\")\n"
  )
  file(
      APPEND
      "${HUNTER_DOWNLOAD_TOOLCHAIN}"
      "set(HUNTER_NO_TOOLCHAIN_ID_RECALCULATION \"${HUNTER_NO_TOOLCHAIN_ID_RECALCULATION}\" CACHE INTERNAL \"\")\n"
  )

  string(COMPARE NOTEQUAL "${CMAKE_MAKE_PROGRAM}" "" has_make)
  if(has_make)
    file(
        APPEND
        "${HUNTER_DOWNLOAD_TOOLCHAIN}"
        "set(CMAKE_MAKE_PROGRAM \"${CMAKE_MAKE_PROGRAM}\" CACHE INTERNAL \"\")\n"
    )
  endif()

  # print info before start generation/run
  hunter_status_debug("Add package: ${HUNTER_PACKAGE_NAME}")
  if(has_component)
    hunter_status_debug("Component: ${HUNTER_PACKAGE_COMPONENT}")
  endif()
  hunter_status_debug("Download scheme: ${HUNTER_DOWNLOAD_SCHEME}")
  hunter_status_debug("Url: ${HUNTER_PACKAGE_URL}")
  hunter_status_debug("SHA1: ${HUNTER_PACKAGE_SHA1}")
  hunter_status_debug("HUNTER_TLS_VERIFY: ${HUNTER_TLS_VERIFY}")

  if(has_internal_deps_id)
    hunter_status_debug(
        "Internal dependencies ID: ${HUNTER_PACKAGE_INTERNAL_DEPS_ID}"
    )
  endif()

  set(_hunter_schemes_search_dirs "")

  set(
      download_scheme
      "${HUNTER_PACKAGE_SETUP_DIR}/schemes/${HUNTER_DOWNLOAD_SCHEME}.cmake.in"
  )
  set(_hunter_schemes_search_dirs "${_hunter_schemes_search_dirs}, ${download_scheme}")

  if(NOT EXISTS "${download_scheme}")
    set(
      download_scheme
      "${HUNTER_SELF}/cmake/schemes/${HUNTER_DOWNLOAD_SCHEME}.cmake.in"
    )
    set(_hunter_schemes_search_dirs "${_hunter_schemes_search_dirs}, ${download_scheme}")
    if(NOT EXISTS "${download_scheme}")
      hunter_internal_error("Download scheme `${download_scheme}` not found. Search locations: ${_hunter_schemes_search_dirs}")
    endif()
  endif()

  hunter_status_debug(
      "Scheme file used: ${download_scheme}"
  )

  configure_file(
      "${download_scheme}"
      "${HUNTER_PACKAGE_HOME_DIR}/CMakeLists.txt"
      @ONLY
  )

  set(build_message "Building ${HUNTER_PACKAGE_NAME}")
  if(has_component)
    set(
        build_message
        "${build_message} (component: ${HUNTER_PACKAGE_COMPONENT})"
    )
  endif()
  hunter_status_print("${build_message}")

  set(allow_builds TRUE)
  if(HUNTER_DISABLE_BUILDS)
    set(allow_builds FALSE)
  endif()
  string(COMPARE EQUAL "${HUNTER_USE_CACHE_SERVERS}" "ONLY" only_server)
  if(only_server)
    set(allow_builds FALSE)
  endif()

  if(NOT allow_builds AND HUNTER_PACKAGE_SCHEME_INSTALL)
    hunter_fatal_error(
        "Building package from source is disabled (dir: ${HUNTER_PACKAGE_HOME_DIR})"
        ERROR_PAGE "error.build.disabled"
    )
  endif()

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
  string(COMPARE NOTEQUAL "${CMAKE_GENERATOR_TOOLSET}" "" has_toolset)
  if(has_toolset)
    hunter_status_debug("Add toolset: '${CMAKE_GENERATOR_TOOLSET}'")
    list(APPEND cmd "-T" "${CMAKE_GENERATOR_TOOLSET}")
  endif()

  if(has_make)
    list(APPEND cmd "-DCMAKE_MAKE_PROGRAM=${CMAKE_MAKE_PROGRAM}")
  endif()

  string(COMPARE NOTEQUAL "${CMAKE_GENERATOR_PLATFORM}" "" has_gen_platform)
  if(has_gen_platform)
    list(APPEND cmd "-A" "${CMAKE_GENERATOR_PLATFORM}")
  endif()

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
        ERROR_PAGE "error.external.build.failed"
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
        ERROR_PAGE "error.external.build.failed"
    )
  endif()

  if(HUNTER_PACKAGE_SCHEME_DOWNLOAD)
    # This scheme not using ExternalProject_Add so there will be no stamps
  else()
    hunter_find_stamps("${HUNTER_PACKAGE_BUILD_DIR}")
  endif()

  hunter_save_to_cache()

  hunter_status_debug("Cleaning up build directories...")

  file(REMOVE_RECURSE "${helper_dir_to_remove}")

  file(REMOVE_RECURSE "${HUNTER_PACKAGE_BUILD_DIR}")
  if(HUNTER_PACKAGE_SCHEME_INSTALL)
    if(keep_sources)
      hunter_status_debug(
          "Keep source directory '${HUNTER_PACKAGE_SOURCE_DIR}'"
      )
    else()
      # Unpacked directory not needed (save some disk space)
      file(REMOVE_RECURSE "${HUNTER_PACKAGE_SOURCE_DIR}")
    endif()
  endif()

  file(REMOVE "${HUNTER_PACKAGE_HOME_DIR}/CMakeLists.txt")
  file(REMOVE "${HUNTER_DOWNLOAD_TOOLCHAIN}")
  file(REMOVE "${HUNTER_ARGS_FILE}")

  if(HUNTER_PACKAGE_CACHEABLE)
    file(REMOVE_RECURSE "${HUNTER_PACKAGE_INSTALL_PREFIX}")
  endif()

  hunter_status_debug("Clean up done")

  file(WRITE "${HUNTER_PACKAGE_DONE_STAMP}" "")

  # Note: will remove 'HUNTER_PACKAGE_BUILD_DIR'
  hunter_upload_cache()

  # In:
  # * HUNTER_PACKAGE_HOME_DIR
  # * HUNTER_PACKAGE_LICENSE_SEARCH_DIR
  # * HUNTER_PACKAGE_NAME
  # * HUNTER_PACKAGE_SCHEME_UNPACK
  # * HUNTER_PACKAGE_SHA1
  # Out:
  # * ${HUNTER_PACKAGE_NAME}_LICENSES (parent scope)
  hunter_find_licenses()
endfunction()
