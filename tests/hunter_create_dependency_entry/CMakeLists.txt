# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterCreateDependencyEntry)

include(hunter_create_dependency_entry)

set(config_id "${CMAKE_CURRENT_BINARY_DIR}/config-id")
set(HUNTER_CONFIG_ID_PATH "${config_id}")

### No cache
file(REMOVE_RECURSE "${config_id}")

hunter_create_dependency_entry(PACKAGE "Foo" COMPONENT "" RESULT result)
if(NOT result STREQUAL "")
  message(FATAL_ERROR "not empty")
endif()

### Cache for package
file(REMOVE_RECURSE "${config_id}")

set(foo_home "${config_id}/Build/Foo")
file(WRITE "${foo_home}/cache.sha1" "Foo-SHA1")

hunter_create_dependency_entry(PACKAGE "Foo" COMPONENT "" RESULT result)
if(NOT result STREQUAL "Foo Foo-SHA1")
  message(FATAL_ERROR "wrong entry")
endif()

### Cache for package with component
file(REMOVE_RECURSE "${config_id}")

set(foo_home "${config_id}/Build/Foo/__Boo")
file(WRITE "${foo_home}/cache.sha1" "Foo-Boo-SHA1")

hunter_create_dependency_entry(PACKAGE "Foo" COMPONENT "Boo" RESULT result)
if(NOT result STREQUAL "Foo Boo Foo-Boo-SHA1")
  message(FATAL_ERROR "wrong entry")
endif()
