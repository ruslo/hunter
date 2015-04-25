cmake_minimum_required(VERSION 3.0)

include("../../../examples/common.cmake")
project(TestIssue22)

include(hunter_config)
include(hunter_configuration_types)

set(HUNTER_ALLOW_CONFIG_LOADING YES)

message("--- Empty by default ---")
hunter_config(Foo VERSION 1.0)
string(COMPARE EQUAL "${HUNTER_Foo_CONFIGURATION_TYPES}" "" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate cmake/configs/default.cmake ---")
hunter_config(Boo VERSION 2.0 CONFIGURATION_TYPES Release)
string(COMPARE EQUAL "${HUNTER_Boo_CONFIGURATION_TYPES}" "Release" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate cmake/configs/default.cmake ---")
hunter_config(Boo VERSION 2.0 CONFIGURATION_TYPES Release)
string(COMPARE EQUAL "${HUNTER_Boo_CONFIGURATION_TYPES}" "Release" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate user's config.cmake ---")
hunter_config(Bar VERSION 2.0 CONFIGURATION_TYPES Release) # default
hunter_config(Bar VERSION 2.0 CONFIGURATION_TYPES UserRelease) # user's
string(COMPARE EQUAL "${HUNTER_Bar_CONFIGURATION_TYPES}" "UserRelease" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate default in hunter.cmake ---")
hunter_config(Baz VERSION 2.0) # default
# hunter.cmake
hunter_configuration_types(Baz CONFIGURATION_TYPES "Release;Debug")
string(COMPARE EQUAL "${HUNTER_Baz_CONFIGURATION_TYPES}" "Release;Debug" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate default in hunter.cmake (list) ---")
hunter_config(Roo VERSION 2.0) # default
# hunter.cmake
hunter_configuration_types(Roo CONFIGURATION_TYPES Release Debug)
string(COMPARE EQUAL "${HUNTER_Roo_CONFIGURATION_TYPES}" "Release;Debug" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate user overwrite default in hunter.cmake ---")
hunter_config(Qoo VERSION 2.0) # default
hunter_config(Qoo VERSION 2.0 CONFIGURATION_TYPES MyRelease Debug) # user
# hunter.cmake
hunter_configuration_types(Qoo CONFIGURATION_TYPES Release Debug)
string(COMPARE EQUAL "${HUNTER_Qoo_CONFIGURATION_TYPES}" "MyRelease;Debug" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Count types ---")
hunter_config(Qt VERSION 2.0 CONFIGURATION_TYPES MyRelease Debug Fast) # user
set(counter "")
foreach(config ${HUNTER_Qt_CONFIGURATION_TYPES})
  set(counter "${counter}x")
endforeach()
string(COMPARE EQUAL "${counter}" "xxx" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()
