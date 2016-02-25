# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterGetPackageDeps)

include(hunter_get_package_deps)

set(package_name "Foo")
set(toolchain_id "${CMAKE_CURRENT_BINARY_DIR}/toolchain-id")

set(HUNTER_TOOLCHAIN_ID_PATH "${toolchain_id}")

set(home_dir "${toolchain_id}/Build/${package_name}")
set(dependencies_dir "${home_dir}/Dependencies")

function(cleanup)
  file(REMOVE_RECURSE "${home_dir}")
  file(MAKE_DIRECTORY "${home_dir}")
endfunction()

### Test empty
cleanup()
hunter_get_package_deps(PACKAGE "${package_name}" RESULT result)

string(COMPARE EQUAL "${result}" "" is_empty)
if(NOT is_empty)
  message(FATAL_ERROR "Expected empty list")
endif()

### Test one
cleanup()
file(WRITE "${dependencies_dir}/Boo/__dep" "")
hunter_get_package_deps(PACKAGE "${package_name}" RESULT result)

string(COMPARE EQUAL "${result}" "Boo" is_equal)
if(NOT is_equal)
  message(FATAL_ERROR "Expected Boo: ${result}")
endif()

### Test several
cleanup()
file(WRITE "${dependencies_dir}/C/__dep" "")
file(WRITE "${dependencies_dir}/B/__dep" "")
file(WRITE "${dependencies_dir}/A/__dep" "")
hunter_get_package_deps(PACKAGE "${package_name}" RESULT result)

string(COMPARE EQUAL "${result}" "A;B;C" is_equal)
if(NOT is_equal)
  message(FATAL_ERROR "Expected A;B;C: ${result}")
endif()

### Dependencies for component
cleanup()
set(component "FDSA")
file(WRITE "${home_dir}/__${component}/Dependencies/C3/__dep" "")
file(WRITE "${home_dir}/__${component}/Dependencies/B2/__dep" "")
file(WRITE "${home_dir}/__${component}/Dependencies/A1/__dep" "")
hunter_get_package_deps(
    PACKAGE "${package_name}" COMPONENT "${component}" RESULT result
)

string(COMPARE EQUAL "${result}" "A1;B2;C3" is_equal)
if(NOT is_equal)
  message(FATAL_ERROR "Expected A1;B2;C3: ${result}")
endif()

### Component as dependency
cleanup()
set(dep_package "ERT")
set(dep_component "JKL")
file(WRITE "${dependencies_dir}/${dep_package}/${dep_component}/__dep" "")
hunter_get_package_deps(
    PACKAGE "${package_name}" RESULT result
)

string(COMPARE EQUAL "${result}" "${dep_package} ${dep_component}" is_equal)
if(NOT is_equal)
  message(FATAL_ERROR "Expected ${dep_package} ${dep_component}: ${result}")
endif()
