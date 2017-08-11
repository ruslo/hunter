# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterRegisterDependency)

include(hunter_register_dependency)

set(config_id "${CMAKE_CURRENT_BINARY_DIR}/config-id")
set(HUNTER_CONFIG_ID_PATH "${config_id}")

set(expected "${config_id}/Build/Foo/Dependencies/Boo/__dep")
file(REMOVE_RECURSE "${config_id}")
if(EXISTS "${expected}")
  message(FATAL_ERROR "Exists")
endif()
hunter_register_dependency(
    PACKAGE "Foo;"
    DEPENDS_ON_PACKAGE "Boo"
    DEPENDS_ON_COMPONENT ""
)
if(NOT EXISTS "${expected}")
  message(FATAL_ERROR "Not exists")
endif()

set(expected "${config_id}/Build/Foo/__Boo/Dependencies/Bar/__dep")
file(REMOVE_RECURSE "${config_id}")
if(EXISTS "${expected}")
  message(FATAL_ERROR "Exists")
endif()
hunter_register_dependency(
    PACKAGE "Foo;Boo"
    DEPENDS_ON_PACKAGE "Bar"
    DEPENDS_ON_COMPONENT ""
)
if(NOT EXISTS "${expected}")
  message(FATAL_ERROR "Not exists")
endif()

set(expected "${config_id}/Build/Foo/Dependencies/Boo/Bar/__dep")
file(REMOVE_RECURSE "${config_id}")
if(EXISTS "${expected}")
  message(FATAL_ERROR "Exists")
endif()
hunter_register_dependency(
    PACKAGE "Foo;"
    DEPENDS_ON_PACKAGE "Boo"
    DEPENDS_ON_COMPONENT "Bar"
)
if(NOT EXISTS "${expected}")
  message(FATAL_ERROR "Not exists")
endif()

set(expected "${config_id}/Build/Foo/__Boo/Dependencies/Bar/Baz/__dep")
file(REMOVE_RECURSE "${config_id}")
if(EXISTS "${expected}")
  message(FATAL_ERROR "Exists")
endif()
hunter_register_dependency(
    PACKAGE "Foo;Boo"
    DEPENDS_ON_PACKAGE "Bar"
    DEPENDS_ON_COMPONENT "Baz"
)
if(NOT EXISTS "${expected}")
  message(FATAL_ERROR "Not exists")
endif()
