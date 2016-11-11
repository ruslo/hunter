# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

include(hunter_user_error)

function(hunter_protected_sources package_name)
  if(CMAKE_VERSION VERSION_LESS "3.7")
    hunter_user_error(
        "'hunter_protected_sources' need CMake version 3.7+, see"
        " https://docs.hunter.sh/en/latest/quick-start/cmake.html"
    )
  endif()
  set("HUNTER_${package_name}_PROTECTED_SOURCES" YES PARENT_SCOPE)
endfunction()
