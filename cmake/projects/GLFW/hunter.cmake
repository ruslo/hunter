# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_GLFW_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GLFW_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    GLFW
    VERSION
    "3.1.2"
    URL
    "https://github.com/glfw/glfw/archive/3.1.2.tar.gz"
    SHA1
    3033c604e3109c59cf04918bc473268fe18c828b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(GLFW)
hunter_download(PACKAGE_NAME GLFW)

