cmake_minimum_required(VERSION 3.0)

include("../../../examples/common.cmake")
project(TestIssue22)

include(hunter_default_version)
include(hunter_config)
include(hunter_configuration_types)

set(__HUNTER_ALLOW_DEFAULT_VERSION_LOADING YES)
set(__HUNTER_ALLOW_CONFIG_LOADING YES)

message("--- define default versions in alphabetical order ---")
hunter_default_version(Bar VERSION 2.0)
hunter_default_version(Baz VERSION 2.0)
hunter_default_version(Boo VERSION 2.0)
hunter_default_version(Foo VERSION 1.0)
hunter_default_version(Qoo VERSION 2.0)
hunter_default_version(Qt  VERSION 2.0)
hunter_default_version(Roo VERSION 2.0)

message("--- Empty by default ---")
string(COMPARE EQUAL "${HUNTER_Foo_CONFIGURATION_TYPES}" "" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate cmake/configs/default.cmake ---")
hunter_config(Boo VERSION 2.0 CONFIGURATION_TYPES Release)
string(COMPARE EQUAL "${__HUNTER_USER_CONFIGURATION_TYPES_Boo}" "Release" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate cmake/configs/default.cmake ---")
hunter_config(Boo VERSION 2.0 CONFIGURATION_TYPES Release)
string(COMPARE EQUAL "${__HUNTER_USER_CONFIGURATION_TYPES_Boo}" "Release" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate user's config.cmake ---")
hunter_config(Bar VERSION 2.0 CONFIGURATION_TYPES UserRelease) # user's
string(COMPARE EQUAL "${__HUNTER_USER_CONFIGURATION_TYPES_Bar}" "UserRelease" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate default in hunter.cmake ---")
# hunter.cmake
hunter_configuration_types(Baz CONFIGURATION_TYPES "Release;Debug")
string(COMPARE EQUAL "${__HUNTER_DEFAULT_CONFIGURATION_TYPES_Baz}" "Release;Debug" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate default in hunter.cmake (list) ---")
# hunter.cmake
hunter_configuration_types(Roo CONFIGURATION_TYPES Release Debug)
string(COMPARE EQUAL "${__HUNTER_DEFAULT_CONFIGURATION_TYPES_Roo}" "Release;Debug" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Emulate user overwrite default in hunter.cmake ---")
hunter_config(Qoo VERSION 2.0 CONFIGURATION_TYPES MyRelease Debug) # user
# hunter.cmake
hunter_configuration_types(Qoo CONFIGURATION_TYPES Release Debug)
string(COMPARE EQUAL "${__HUNTER_USER_CONFIGURATION_TYPES_Qoo}" "MyRelease;Debug" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()

message("--- Count types ---")
hunter_config(Qt VERSION 2.0 CONFIGURATION_TYPES MyRelease Debug Fast) # user
set(counter "")
foreach(config ${__HUNTER_USER_CONFIGURATION_TYPES_Qt})
  set(counter "${counter}x")
endforeach()
string(COMPARE EQUAL "${counter}" "xxx" is_ok)
if(NOT is_ok)
  message(FATAL_ERROR "FAILED")
endif()
