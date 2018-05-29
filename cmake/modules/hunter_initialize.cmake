# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_calculate_self)
include(hunter_flush_cache_variables)
include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

macro(hunter_initialize)
  get_property(_gate_done GLOBAL PROPERTY HUNTER_GATE_DONE SET)

  if(HUNTER_GATE_DONE)
    # Can be set explicitly in case of loading package
    # from scheme (without HunterGate)
    set(_gate_done YES)
  endif()

  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_CACHED_ROOT}${HUNTER_VERSION}${HUNTER_SHA1}"
      ""
      _cache_init
  )

  # Unify values
  if(_gate_done)
    set(_gate_done YES)
  else()
    set(_gate_done NO)
  endif()

  # Unify values
  if(_cache_init)
    set(_cache_init YES)
  else()
    set(_cache_init NO)
  endif()

  hunter_status_debug("Settings (initialize):")
  hunter_status_debug("  HunterGate done (${_gate_done})")
  hunter_status_debug("  Cache init (${_cache_init})")

  if(_gate_done)
    if(NOT _cache_init)
      hunter_internal_error("_gate_done AND NOT _cache_init")
    endif()
  elseif(_cache_init)
    set(_flush FALSE)

    string(COMPARE EQUAL "${HUNTER_CACHED_ROOT}" "${HUNTER_GATE_ROOT}" _is_ok)
    if(NOT _is_ok)
      hunter_status_debug("HUNTER_ROOT changed:")
      hunter_status_debug("  ${HUNTER_CACHED_ROOT}")
      hunter_status_debug("  ${HUNTER_GATE_ROOT}")
      set(_flush TRUE)
    endif()

    string(COMPARE EQUAL "${HUNTER_VERSION}" "${HUNTER_GATE_VERSION}" _is_ok)
    if(NOT _is_ok)
      hunter_status_debug("HUNTER_VERSION changed:")
      hunter_status_debug("  ${HUNTER_VERSION}")
      hunter_status_debug("  ${HUNTER_GATE_VERSION}")
      set(_flush TRUE)
    endif()

    string(COMPARE EQUAL "${HUNTER_SHA1}" "${HUNTER_GATE_SHA1}" _is_ok)
    if(NOT _is_ok)
      hunter_status_debug("HUNTER_SHA1 changed:")
      hunter_status_debug("  ${HUNTER_SHA1}")
      hunter_status_debug("  ${HUNTER_GATE_SHA1}")
      set(_flush TRUE)
    endif()

    if(_flush)
      set(HUNTER_CACHED_ROOT "${HUNTER_GATE_ROOT}" CACHE INTERNAL "")
      set(HUNTER_VERSION "${HUNTER_GATE_VERSION}" CACHE INTERNAL "")
      set(HUNTER_SHA1 "${HUNTER_GATE_SHA1}" CACHE INTERNAL "")
      set(HUNTER_URL "${HUNTER_GATE_URL}" CACHE INTERNAL "")

      hunter_calculate_self(
          "${HUNTER_CACHED_ROOT}"
          "${HUNTER_VERSION}"
          "${HUNTER_SHA1}"
          HUNTER_SELF
      )

      hunter_flush_cache_variables("${HUNTER_SELF}")

      set(HUNTER_CONFIG_SHA1 "" CACHE INTERNAL "")
      set(HUNTER_TOOLCHAIN_SHA1 "" CACHE INTERNAL "")
      set(HUNTER_CACHED_CONFIGURATION_TYPES "" CACHE INTERNAL "")
      set(HUNTER_CACHED_BUILD_SHARED_LIBS "" CACHE INTERNAL "")
    endif()
  else()
    set(HUNTER_CACHED_ROOT "${HUNTER_GATE_ROOT}" CACHE INTERNAL "")
    set(HUNTER_VERSION "${HUNTER_GATE_VERSION}" CACHE INTERNAL "")
    set(HUNTER_SHA1 "${HUNTER_GATE_SHA1}" CACHE INTERNAL "")
    set(HUNTER_URL "${HUNTER_GATE_URL}" CACHE INTERNAL "")
  endif()


  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")
  hunter_assert_not_empty_string("${HUNTER_VERSION}")
  hunter_assert_not_empty_string("${HUNTER_SHA1}")
  hunter_assert_not_empty_string("${HUNTER_URL}")

  # All variables are ready so let's set HUNTER_SELF here. Usually it's not
  # needed before 'hunter_finalize' but it some cases may be useful
  # (see https://github.com/ruslo/hunter/pull/496#discussion_r75679671)
  hunter_calculate_self(
      "${HUNTER_CACHED_ROOT}"
      "${HUNTER_VERSION}"
      "${HUNTER_SHA1}"
      HUNTER_SELF
  )
endmacro()
