# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_calculate_config_sha1)
include(hunter_calculate_self)
include(hunter_calculate_toolchain_sha1)
include(hunter_check_flush_needed)
include(hunter_internal_error)
include(hunter_set_config_location)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

function(hunter_apply_gate_settings)
  hunter_assert_not_empty_string("${HUNTER_CONFIGURATION_TYPES}")

  get_property(gate_done GLOBAL PROPERTY HUNTER_GATE_SETTINGS_APPLIED SET)
  set_property(GLOBAL PROPERTY HUNTER_GATE_SETTINGS_APPLIED YES)

  if(HUNTER_GATE_SETTINGS_APPLIED)
    # Can be set explicitly in case of loading package
    # from scheme (without HunterGate)
    set(gate_done YES)
  endif()

  # Check any of cache variable is not empty
  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_CONFIG_SHA1}${HUNTER_TOOLCHAIN_SHA1}${HUNTER_CACHED_CONFIGURATION_TYPES}"
      ""
      cache_init
  )

  # Unify values
  if(gate_done)
    set(gate_done YES)
  else()
    set(gate_done NO)
  endif()

  # Unify values
  if(cache_init)
    set(cache_init YES)
  else()
    set(cache_init NO)
  endif()

  hunter_status_debug("Settings (finalize):")
  hunter_status_debug("  HunterGate done (${gate_done})")
  hunter_status_debug("  Cache init (${cache_init})")

  if(gate_done)
    if(cache_init)
      # set *_ID_PATH variables in parent scope
      string(SUBSTRING "${HUNTER_SHA1}" 0 7 HUNTER_ID)
      string(SUBSTRING "${HUNTER_CONFIG_SHA1}" 0 7 HUNTER_CONFIG_ID)
      string(SUBSTRING "${HUNTER_TOOLCHAIN_SHA1}" 0 7 HUNTER_TOOLCHAIN_ID)
      set(HUNTER_ID_PATH "${HUNTER_CACHED_ROOT}/_Base/${HUNTER_ID}")
      set(HUNTER_TOOLCHAIN_ID_PATH "${HUNTER_ID_PATH}/${HUNTER_TOOLCHAIN_ID}")
      set(HUNTER_CONFIG_ID_PATH "${HUNTER_TOOLCHAIN_ID_PATH}/${HUNTER_CONFIG_ID}")
      set(HUNTER_ID_PATH "${HUNTER_ID_PATH}" PARENT_SCOPE)
      set(HUNTER_TOOLCHAIN_ID_PATH "${HUNTER_TOOLCHAIN_ID_PATH}" PARENT_SCOPE)
      set(HUNTER_CONFIG_ID_PATH "${HUNTER_CONFIG_ID_PATH}" PARENT_SCOPE)
      hunter_status_debug("Reuse cached values")
      return()
    endif()
    hunter_internal_error("Gate finished but no cache")
  endif()

  hunter_status_debug("Variables from HunterGate:")
  hunter_status_debug("  HUNTER_GATE_ROOT: ${HUNTER_GATE_ROOT}")
  hunter_status_debug("  HUNTER_GATE_VERSION: ${HUNTER_GATE_VERSION}")
  hunter_status_debug("  HUNTER_GATE_SHA1: ${HUNTER_GATE_SHA1}")

  hunter_calculate_self(
      "${HUNTER_GATE_ROOT}"
      "${HUNTER_GATE_VERSION}"
      "${HUNTER_GATE_SHA1}"
      hunter_self
  )
  hunter_set_config_location("${hunter_self}" config_location)

  set(hunter_base "${HUNTER_GATE_ROOT}/_Base")

  list(LENGTH HUNTER_CONFIGURATION_TYPES len)
  if(NOT len EQUAL "1")
    foreach(configuration ${HUNTER_CONFIGURATION_TYPES})
      string(TOUPPER "${configuration}" configuration_upper)
      string(COMPARE EQUAL "${configuration_upper}" "RELEASE" is_release)
      string(COMPARE EQUAL "${configuration_upper}" "DEBUG" is_debug)
      string(COMPARE EQUAL "${CMAKE_${configuration_upper}_POSTFIX}" "" is_empty)
      if(NOT is_release AND is_empty)
        if(is_debug)
          set(CMAKE_DEBUG_POSTFIX "d")
          hunter_status_debug("Set CMAKE_DEBUG_POSTFIX to: d")
        else()
          set(CMAKE_${configuration_upper}_POSTFIX "-${configuration}")
          hunter_status_debug(
              "Set CMAKE_${configuration_upper}_POSTFIX to: -${configuration}"
          )
        endif()
      endif()
    endforeach()
  endif()

  hunter_make_directory("${hunter_base}" "${HUNTER_GATE_SHA1}" hunter_id_path)

  if("${HUNTER_TOOLCHAIN_SHA1}" STREQUAL "")
    set(skip_toolchain_calculation NO)
  elseif(HUNTER_NO_TOOLCHAIN_ID_RECALCULATION)
    hunter_make_directory(
        "${hunter_id_path}"
        "${HUNTER_TOOLCHAIN_SHA1}"
        hunter_toolchain_id_path
    )
    if(EXISTS "${hunter_toolchain_id_path}/toolchain.info")
      set(skip_toolchain_calculation YES)
    else()
      set(skip_toolchain_calculation NO)
    endif()
  else()
    set(skip_toolchain_calculation NO)
  endif()

  if(skip_toolchain_calculation)
    hunter_status_debug("Toolchain-ID recalculation will be skipped")
    set(HUNTER_GATE_TOOLCHAIN_SHA1 "${HUNTER_TOOLCHAIN_SHA1}")
  else()
    # * defines: HUNTER_GATE_TOOLCHAIN_SHA1
    # * needs: HUNTER_CONFIGURATION_TYPES
    # * needs: HUNTER_BUILD_SHARED_LIBS
    # * creates: global_toolchain_info at
    #   "${hunter_base}/${HUNTER_GATE_SHA1}/${HUNTER_GATE_TOOLCHAIN_SHA1}/toolchain.info"
    hunter_calculate_toolchain_sha1("${hunter_self}" "${hunter_base}")
  endif()

  # set PATH variables for hunter and toolchain
  hunter_make_directory(
      "${hunter_id_path}"
      "${HUNTER_GATE_TOOLCHAIN_SHA1}"
      hunter_toolchain_id_path
  )
  set(HUNTER_ID_PATH "${hunter_id_path}" PARENT_SCOPE)
  set(HUNTER_TOOLCHAIN_ID_PATH "${hunter_toolchain_id_path}")
  set(HUNTER_TOOLCHAIN_ID_PATH "${hunter_toolchain_id_path}" PARENT_SCOPE)

  # * defines: HUNTER_GATE_CONFIG_SHA1
  # * needs: HUNTER_TOOLCHAIN_ID_PATH
  # * creates: unified global config file at
  #   "${hunter_base}/${HUNTER_GATE_SHA1}/${HUNTER_GATE_TOOLCHAIN_SHA1}/${HUNTER_GATE_CONFIG_SHA1/config.cmake"
  hunter_calculate_config_sha1(
      "${hunter_self}" "${hunter_base}" "${config_location}"
  )
  # set PATH variables for config folder
  hunter_make_directory(
      "${hunter_toolchain_id_path}"
      "${HUNTER_GATE_CONFIG_SHA1}"
      hunter_config_id_path
  )
  set(HUNTER_CONFIG_ID_PATH "${hunter_config_id_path}" PARENT_SCOPE)


  # test if mandatory variables are set
  hunter_assert_not_empty_string("${HUNTER_GATE_ROOT}")
  hunter_assert_not_empty_string("${HUNTER_GATE_SHA1}")
  hunter_assert_not_empty_string("${HUNTER_GATE_CONFIG_SHA1}")
  hunter_assert_not_empty_string("${HUNTER_GATE_VERSION}")
  hunter_assert_not_empty_string("${HUNTER_GATE_TOOLCHAIN_SHA1}")

  if(cache_init)
    hunter_check_flush_needed("${hunter_self}" flush_done)
    if(flush_done)
      hunter_status_debug("Cache flushed")
    else()
      hunter_status_debug("Cache data is up-to-date")
      return()
    endif()
  endif()

  # See hunter_initialize
  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")
  hunter_assert_not_empty_string("${HUNTER_VERSION}")
  hunter_assert_not_empty_string("${HUNTER_SHA1}")

  # This variables will be saved in HUNTER_CACHE_FILE (hunter_create_cache_file)
  set(HUNTER_CONFIG_SHA1 "${HUNTER_GATE_CONFIG_SHA1}" CACHE INTERNAL "")
  set(HUNTER_TOOLCHAIN_SHA1 "${HUNTER_GATE_TOOLCHAIN_SHA1}" CACHE INTERNAL "")
  set(
      HUNTER_CACHED_CONFIGURATION_TYPES
      "${HUNTER_CONFIGURATION_TYPES}"
      CACHE
      INTERNAL
      ""
  )
  foreach(configuration ${HUNTER_CACHED_CONFIGURATION_TYPES})
    string(TOUPPER "${configuration}" configuration_upper)
    set(
        CMAKE_${configuration_upper}_POSTFIX
        "${CMAKE_${configuration_upper}_POSTFIX}"
        CACHE
        INTERNAL
        ""
    )
  endforeach()
  set(
      HUNTER_CACHED_BUILD_SHARED_LIBS
      "${HUNTER_BUILD_SHARED_LIBS}"
      CACHE
      INTERNAL
      ""
  )
endfunction()
