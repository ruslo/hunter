# Copyright (c) 2015-2016, Ruslan Baratov
# All rights reserved.

include(hunter_apply_copy_rules)
include(hunter_apply_gate_settings)
include(hunter_calculate_self)
include(hunter_create_cache_file)
include(hunter_fatal_error)
include(hunter_internal_error)
include(hunter_sanity_checks)
include(hunter_status_debug)
include(hunter_status_print)
include(hunter_assert_not_empty_string)

# Continue initialization of key variables (also see 'hunter_initialize')
#   * calculate toolchain-id
#   * calculate config-id
macro(hunter_finalize)
  # Check preconditions
  hunter_sanity_checks()

  string(COMPARE EQUAL "${HUNTER_CACHE_SERVERS}" "" _is_empty)
  if(_is_empty)
    hunter_status_debug("Using default cache server")
    set(HUNTER_CACHE_SERVERS "https://github.com/ingenue/hunter-cache")
  endif()

  hunter_status_debug("List of cache servers:")
  foreach(_server ${HUNTER_CACHE_SERVERS})
    hunter_status_debug("  * ${_server}")
  endforeach()

  get_property(_enabled_languages GLOBAL PROPERTY ENABLED_LANGUAGES)

  list(FIND _enabled_languages "C" _c_enabled_result)
  if(_c_enabled_result EQUAL -1)
    set(_c_enabled FALSE)
  else()
    set(_c_enabled TRUE)
  endif()

  list(FIND _enabled_languages "CXX" _cxx_enabled_result)
  if(_cxx_enabled_result EQUAL -1)
    set(_cxx_enabled FALSE)
  else()
    set(_cxx_enabled TRUE)
  endif()

  if(_c_enabled AND NOT CMAKE_C_ABI_COMPILED)
    hunter_fatal_error(
        "ABI not detected for C compiler" ERROR_PAGE "error.abi.detection.failure"
    )
  endif()

  if(_cxx_enabled AND NOT CMAKE_CXX_ABI_COMPILED)
    hunter_fatal_error(
        "ABI not detected for CXX compiler" ERROR_PAGE "error.abi.detection.failure"
    )
  endif()

  string(COMPARE NOTEQUAL "$ENV{HUNTER_BINARY_DIR}" "" _env_not_empty)
  if(_env_not_empty)
    get_filename_component(HUNTER_BINARY_DIR "$ENV{HUNTER_BINARY_DIR}" ABSOLUTE)
    hunter_status_debug("HUNTER_BINARY_DIR: ${HUNTER_BINARY_DIR}")
  endif()

  # * Read HUNTER_GATE_* variables
  # * Check cache HUNTER_* variables is up-to-date
  # * Update cache if needed
  # * define HUNTER_ID_PATH
  # * define HUNTER_TOOLCHAIN_ID_PATH
  # * define HUNTER_CONFIG_ID_PATH
  hunter_apply_gate_settings()

  string(SUBSTRING "${HUNTER_SHA1}" 0 7 HUNTER_ID)
  string(SUBSTRING "${HUNTER_CONFIG_SHA1}" 0 7 HUNTER_CONFIG_ID)
  string(SUBSTRING "${HUNTER_TOOLCHAIN_SHA1}" 0 7 HUNTER_TOOLCHAIN_ID)

  set(HUNTER_INSTALL_PREFIX "${HUNTER_CONFIG_ID_PATH}/Install")
  list(APPEND CMAKE_PREFIX_PATH "${HUNTER_INSTALL_PREFIX}")

  # Override pkg-config default search path
  # https://github.com/ruslo/hunter/issues/762
  if(NOT MSVC)
    set(_pkg_config_dir1 "${HUNTER_INSTALL_PREFIX}/lib/pkgconfig")
    set(_pkg_config_dir2 "${HUNTER_INSTALL_PREFIX}/share/pkgconfig")
    # This info is also in hunter_autotools_project.cmake
    set(ENV{PKG_CONFIG_LIBDIR} "${_pkg_config_dir1}:${_pkg_config_dir2}")
  endif()

  if(ANDROID)
    # OpenCV support: https://github.com/ruslo/hunter/issues/153
    list(APPEND CMAKE_PREFIX_PATH "${HUNTER_INSTALL_PREFIX}/sdk/native/jni")
  endif()
  list(APPEND CMAKE_FIND_ROOT_PATH "${HUNTER_INSTALL_PREFIX}")

  hunter_status_print("HUNTER_ROOT: ${HUNTER_CACHED_ROOT}")
  hunter_status_debug("HUNTER_TOOLCHAIN_ID_PATH: ${HUNTER_TOOLCHAIN_ID_PATH}")
  hunter_status_debug(
      "HUNTER_CONFIGURATION_TYPES: ${HUNTER_CACHED_CONFIGURATION_TYPES}"
  )
  hunter_status_debug(
      "HUNTER_BUILD_SHARED_LIBS: ${HUNTER_BUILD_SHARED_LIBS}"
  )

  set(_id_info "[ Hunter-ID: ${HUNTER_ID} |")
  set(_id_info "${_id_info} Toolchain-ID: ${HUNTER_TOOLCHAIN_ID} |")
  set(_id_info "${_id_info} Config-ID: ${HUNTER_CONFIG_ID} ]")

  hunter_status_print("${_id_info}")

  set(HUNTER_CACHE_FILE "${HUNTER_CONFIG_ID_PATH}/cache.cmake")
  hunter_create_cache_file("${HUNTER_CACHE_FILE}")

  if(MSVC)
    include(hunter_setup_msvc)
    hunter_setup_msvc()
  endif()

  ### Disable package registry
  ### http://www.cmake.org/cmake/help/v3.1/manual/cmake-packages.7.html#disabling-the-package-registry
  set(CMAKE_EXPORT_NO_PACKAGE_REGISTRY ON)
  set(CMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY ON)
  set(CMAKE_FIND_PACKAGE_NO_SYSTEM_PACKAGE_REGISTRY ON)
  ### -- end

  ### Disable environment variables
  ### http://www.cmake.org/cmake/help/v3.3/command/find_package.html
  set(ENV{CMAKE_PREFIX_PATH} "")
  set(ENV{CMAKE_FRAMEWORK_PATH} "")
  set(ENV{CMAKE_APPBUNDLE_PATH} "")
  ### -- end

  ### 1. Clear all '<NAME>_ROOT' variables (cache, environment, ...)
  ### 2. Set '<NAME>_ROOT' or 'HUNTER_<name>_VERSION' variables
  set(__HUNTER_ALLOW_FINAL_CONFIG_LOADING YES)
  include("${HUNTER_CONFIG_ID_PATH}/config.cmake")
  set(__HUNTER_ALLOW_FINAL_CONFIG_LOADING NO)

  hunter_assert_not_empty_string("${HUNTER_INSTALL_PREFIX}")
  hunter_assert_not_empty_string("${CMAKE_BINARY_DIR}")

  file(
      WRITE
      "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/install-root-dir"
      "${HUNTER_INSTALL_PREFIX}"
  )

  hunter_apply_copy_rules()

  if(ANDROID AND CMAKE_VERSION VERSION_LESS "3.7.1")
    hunter_user_error(
        "CMake version 3.7.1+ required for Android platforms, see"
        " https://docs.hunter.sh/en/latest/quick-start/cmake.html"
    )
  endif()

  # Android GDBSERVER moved to
  # https://github.com/hunter-packages/android-apk/commit/32531adeb287d3e3b20498ff1a0f76336cbe0551

  # Fix backslashed provided by user:
  # * https://github.com/ruslo/hunter/issues/693
  # Note: we can't use 'get_filename_component(... ABSOLUTE)' because sometimes
  # original path expected. E.g. NMake build:
  # * https://ci.appveyor.com/project/ingenue/hunter/build/1.0.1412/job/o8a21ue85ivt5d0p
  string(REPLACE "\\" "\\\\" CMAKE_MAKE_PROGRAM "${CMAKE_MAKE_PROGRAM}")

  if(CMAKE_INTERPROCEDURAL_OPTIMIZATION AND NOT POLICY CMP0069)
    hunter_user_error("Unsuitable CMake version")
  endif()

  if(IOS AND NOT CMAKE_CROSSCOMPILING)
    hunter_user_error(
        "CMAKE_CROSSCOMPILING should be set on iOS."
        " Please update your toolchain."
    )
  endif()

  string(COMPARE EQUAL "${HUNTER_TLS_VERIFY}" "" _is_empty)
  if(_is_empty)
    hunter_user_error(
        "HUNTER_TLS_VERIFY is empty, please update HunterGate module"
    )
  endif()
endmacro()
