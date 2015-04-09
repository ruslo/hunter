# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_flush_cache_variables)
include(hunter_status_debug)
include(hunter_test_string_not_empty)

function(hunter_check_flush_needed hunter_self flush_done)
  hunter_test_string_not_empty("${flush_done}")
  hunter_test_string_not_empty("${hunter_self}")

  set(flush FALSE)

  string(COMPARE EQUAL "${HUNTER_CACHED_ROOT}" "${HUNTER_GATE_ROOT}" is_ok)
  if(NOT is_ok)
    hunter_status_debug(
        "HUNTER_ROOT changed"
        "  ${HUNTER_CACHED_ROOT}"
        "  ${HUNTER_GATE_ROOT}"
    )
    set(flush TRUE)
  endif()

  string(COMPARE EQUAL "${HUNTER_SHA1}" "${HUNTER_GATE_SHA1}" is_ok)
  if(NOT is_ok)
    hunter_status_debug(
        "HUNTER_SHA1 changed"
        "  ${HUNTER_SHA1}"
        "  ${HUNTER_GATE_SHA1}"
    )
    set(flush TRUE)
  endif()

  string(
      COMPARE EQUAL "${HUNTER_CONFIG_SHA1}" "${HUNTER_GATE_CONFIG_SHA1}" is_ok
  )
  if(NOT is_ok)
    hunter_status_debug(
        "HUNTER_CONFIG_SHA1 changed"
        "  ${HUNTER_CONFIG_SHA1}"
        "  ${HUNTER_GATE_CONFIG_SHA1}"
    )
    set(flush TRUE)
  endif()

  string(
      COMPARE EQUAL "${HUNTER_VERSION}" "${HUNTER_GATE_VERSION}" is_ok
  )
  if(NOT is_ok)
    hunter_status_debug(
        "HUNTER_VERSION changed"
        "  ${HUNTER_VERSION}"
        "  ${HUNTER_GATE_VERSION}"
    )
    set(flush TRUE)
  endif()

  string(
      COMPARE
      EQUAL
      "${HUNTER_TOOLCHAIN_SHA1}"
      "${HUNTER_GATE_TOOLCHAIN_SHA1}"
      is_ok
  )
  if(NOT is_ok)
    hunter_status_debug(
        "HUNTER_TOOLCHAIN_SHA1 changed"
        "  ${HUNTER_TOOLCHAIN_SHA1}"
        "  ${HUNTER_GATE_TOOLCHAIN_SHA1}"
    )
    set(flush TRUE)
  endif()

  if(NOT flush)
    set("${flush_done}" FALSE PARENT_SCOPE)
    return()
  endif()

  hunter_flush_cache_variables("${hunter_self}")
  set("${flush_done}" TRUE PARENT_SCOPE)
endfunction()
