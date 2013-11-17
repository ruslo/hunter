# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(hunter_status_debug)

function(hunter_add_version_start package_name)
  string(TOUPPER ${package_name} package_root_name)
  set(package_root_name "${package_root_name}_ROOT")
  if(NOT "${${package_root_name}}" STREQUAL "")
    hunter_status_debug("${package_name} root: ${${package_root_name}}")
  endif()
  set(package_version_name "HUNTER_${package_name}_VERSION")
  if(NOT "${${package_version_name}}" STREQUAL "")
    hunter_status_debug("${package_name} version: ${${package_version_name}}")
  endif()
endfunction()
