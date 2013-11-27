# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(hunter_status_debug)

function(hunter_add_version_start package_name)
  string(TOUPPER ${package_name} package_root_name)
  set(package_root_name "${package_root_name}_ROOT")
  string(COMPARE NOTEQUAL "${${package_root_name}}" "" is_not_empty)
  if(is_not_empty)
    hunter_status_debug("${package_name} root: ${${package_root_name}}")
  endif()
  set(package_version_name "HUNTER_${package_name}_VERSION")
  string(COMPARE NOTEQUAL "${${package_version_name}}" "" is_not_empty)
  if(is_not_empty)
    hunter_status_debug("${package_name} version: ${${package_version_name}}")
  endif()
endfunction()
