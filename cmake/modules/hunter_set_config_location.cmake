# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include(hunter_internal_error)
include(hunter_status_print)
include(hunter_assert_not_empty_string)
include(hunter_user_error)

function(hunter_set_config_location hunter_self result)
  hunter_assert_not_empty_string("${hunter_self}")
  hunter_assert_not_empty_string("${result}")

  if(HUNTER_GATE_GLOBAL)
    set(
        config_location
        "${hunter_self}/cmake/configs/${HUNTER_GATE_GLOBAL}.cmake"
    )
    if(NOT EXISTS "${config_location}")
      file(
          GLOB config_variants
          RELATIVE "${hunter_self}/cmake/configs"
          "${hunter_self}/cmake/configs/*.cmake"
      )
      hunter_status_print(
           "Config specified by GLOBAL (`${HUNTER_GATE_GLOBAL}`) not found. "
           "Available GLOBAL options:\n"
           "-----------------"
      )
      foreach(var ${config_variants})
        get_filename_component(config "${var}" NAME_WE)
        hunter_status_print("  * ${config}")
      endforeach()
      hunter_status_print("-----------------")
      hunter_user_error("Config not found: ${HUNTER_CONFIG}")
    endif()
  elseif(HUNTER_GATE_LOCAL)
    set(config_location "${HUNTER_GATE_LOCATION}/cmake/Hunter/config.cmake")
  elseif(HUNTER_GATE_FILEPATH)
    set(config_location "${HUNTER_GATE_FILEPATH}")
  else()
    set(config_location "${hunter_self}/cmake/configs/default.cmake")
    if(NOT EXISTS ${config_location})
      hunter_internal_error("${config_location} not found")
    endif()
  endif()

  if(NOT EXISTS "${config_location}")
    hunter_user_error("Config not found: ${config_location}")
  endif()

  set("${result}" "${config_location}" PARENT_SCOPE)
endfunction()
