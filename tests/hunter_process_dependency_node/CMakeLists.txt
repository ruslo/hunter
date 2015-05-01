# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterProcessDependencyNode)

include(hunter_process_dependency_node)
include(hunter_register_dependency)

set(toolchain_id "${CMAKE_CURRENT_BINARY_DIR}/toolchain-id")
set(HUNTER_TOOLCHAIN_ID_PATH "${toolchain_id}")

function(expected_empty x)
  string(COMPARE EQUAL "${x}" "" is_empty)
  if(NOT is_empty)
    message(FATAL_ERROR "Expected empty, bug got: ${x}")
  endif()
endfunction()

function(expected_equal x y)
  if(NOT ${ARGC} EQUAL 2)
    message(FATAL_ERROR "")
  endif()
  string(COMPARE EQUAL "${x}" "${y}" is_equal)
  if(NOT is_equal)
    message(FATAL_ERROR "x:\n  ${x}\nis not equal:\n  ${y}")
  endif()
endfunction()

### Project with no dependencies
file(REMOVE_RECURSE "${toolchain_id}")

set(foo_home "${toolchain_id}/Build/Foo")
file(WRITE "${foo_home}/cache.sha1" "abc")
file(MAKE_DIRECTORY "${foo_home}/Dependencies")

hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT ""
    READY ""
    DEPENDS depends
    FREE free
)
expected_empty("${depends}")
expected_equal("${free}" "Foo abc")

### Project component with no dependencies
file(REMOVE_RECURSE "${toolchain_id}")

set(foo_home "${toolchain_id}/Build/Foo/__Boo")
file(WRITE "${foo_home}/cache.sha1" "1112")
file(MAKE_DIRECTORY "${foo_home}/Dependencies")

hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT "Boo"
    READY ""
    DEPENDS depends
    FREE free
)
expected_empty("${depends}")
expected_equal("${free}" "Foo Boo 1112")

### Project has one dependency
file(REMOVE_RECURSE "${toolchain_id}")

set(foo_home "${toolchain_id}/Build/Foo")
file(WRITE "${foo_home}/cache.sha1" "foo-sha1")
file(MAKE_DIRECTORY "${foo_home}/Dependencies")

set(boo_home "${toolchain_id}/Build/Boo")
file(WRITE "${boo_home}/cache.sha1" "boo-sha1")

hunter_register_dependency(PACKAGE "Foo" DEPENDS_ON_PACKAGE "Boo")

hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT ""
    READY ""
    DEPENDS depends
    FREE free
)
expected_equal("${depends}" "Foo foo-sha1")
expected_equal("${free}" "Boo boo-sha1")

# No clear (updated READY)
hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT ""
    READY "Boo boo-sha1"
    DEPENDS depends
    FREE free
)
expected_empty("${depends}")
expected_equal("${free}" "Foo foo-sha1")

# No clear (updated READY)
hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT ""
    READY "Boo boo-sha1;Foo foo-sha1"
    DEPENDS depends
    FREE free
)
expected_empty("${depends}")
expected_empty("${free}")

### Project has one dependency (component)
file(REMOVE_RECURSE "${toolchain_id}")

set(foo_home "${toolchain_id}/Build/Foo")
file(WRITE "${foo_home}/cache.sha1" "foo-sha1")
file(MAKE_DIRECTORY "${foo_home}/Dependencies")

set(bar_home "${toolchain_id}/Build/Boo/__Bar")
file(WRITE "${bar_home}/cache.sha1" "boo-bar-sha1")

hunter_register_dependency(
    PACKAGE "Foo"
    DEPENDS_ON_PACKAGE "Boo"
    DEPENDS_ON_COMPONENT "Bar"
)

hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT ""
    READY ""
    DEPENDS depends
    FREE free
)
expected_equal("${depends}" "Foo foo-sha1")
expected_equal("${free}" "Boo Bar boo-bar-sha1")

# No clear (updated READY)
hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT ""
    READY "${free}"
    DEPENDS depends
    FREE free
)
expected_empty("${depends}")
expected_equal("${free}" "Foo foo-sha1")

# No clear (updated READY)
hunter_process_dependency_node(
    PACKAGE "Foo"
    COMPONENT ""
    READY "${free};Boo Bar boo-bar-sha1"
    DEPENDS depends
    FREE free
)
expected_empty("${depends}")
expected_empty("${free}")

### Complex

# A -> B
# B -> C/D
# A -> E
# E -> F
# F -> H/I
# F -> G
# H/I -> J

file(REMOVE_RECURSE "${toolchain_id}")

file(WRITE "${toolchain_id}/Build/A/cache.sha1" "A-SHA1")
file(WRITE "${toolchain_id}/Build/B/cache.sha1" "B-SHA1")
file(WRITE "${toolchain_id}/Build/C/__D/cache.sha1" "C-D-SHA1")
file(WRITE "${toolchain_id}/Build/E/cache.sha1" "E-SHA1")
file(WRITE "${toolchain_id}/Build/F/cache.sha1" "F-SHA1")
file(WRITE "${toolchain_id}/Build/G/cache.sha1" "G-SHA1")
file(WRITE "${toolchain_id}/Build/H/__I/cache.sha1" "H-I-SHA1")
file(WRITE "${toolchain_id}/Build/J/cache.sha1" "J-SHA1")

hunter_register_dependency(
    PACKAGE "A"
    DEPENDS_ON_PACKAGE "B"
)
hunter_register_dependency(
    PACKAGE "B"
    DEPENDS_ON_PACKAGE "C"
    DEPENDS_ON_COMPONENT "D"
)
hunter_register_dependency(
    PACKAGE "A"
    DEPENDS_ON_PACKAGE "E"
)
hunter_register_dependency(
    PACKAGE "E"
    DEPENDS_ON_PACKAGE "F"
)
hunter_register_dependency(
    PACKAGE "F"
    DEPENDS_ON_PACKAGE "G"
)
hunter_register_dependency(
    PACKAGE "F"
    DEPENDS_ON_PACKAGE "H"
    DEPENDS_ON_COMPONENT "I"
)
hunter_register_dependency(
    PACKAGE "H;I"
    DEPENDS_ON_PACKAGE "J"
)

# Get package which doesn't depends on anything
hunter_process_dependency_node(
    PACKAGE "A"
    COMPONENT ""
    READY ""
    DEPENDS depends
    FREE free
)
expected_equal("${depends}" "A A-SHA1;B B-SHA1;E E-SHA1;F F-SHA1;H I H-I-SHA1")
expected_equal("${free}" "C D C-D-SHA1;G G-SHA1;J J-SHA1")

# Save packages that doesn't depends on anything, say level-0
# Get packages that doesn't depends on anything except packages from level-0
set(level_0 ${free})
hunter_process_dependency_node(
    PACKAGE "A"
    COMPONENT ""
    READY "${level_0}"
    DEPENDS depends
    FREE free
)
expected_equal("${depends}" "A A-SHA1;E E-SHA1;F F-SHA1")
expected_equal("${free}" "B B-SHA1;H I H-I-SHA1")

# Next level: get packages that doesn't depends on level-0/level-1
set(level_1 ${free})
hunter_process_dependency_node(
    PACKAGE "A"
    COMPONENT ""
    READY "${level_0};${level_1}"
    DEPENDS depends
    FREE free
)
expected_equal("${depends}" "A A-SHA1;E E-SHA1")
expected_equal("${free}" "F F-SHA1")

# Next
set(level_2 ${free})
hunter_process_dependency_node(
    PACKAGE "A"
    COMPONENT ""
    READY "${level_0};${level_1};${level_2}"
    DEPENDS depends
    FREE free
)
expected_equal("${depends}" "A A-SHA1")
expected_equal("${free}" "E E-SHA1")

# Last
set(level_3 ${free})
hunter_process_dependency_node(
    PACKAGE "A"
    COMPONENT ""
    READY "${level_0};${level_1};${level_2};${level_3}"
    DEPENDS depends
    FREE free
)
expected_empty("${depends}")
expected_equal("${free}" "A A-SHA1")
