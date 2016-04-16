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
    "3.2.x"
    URL
    "https://github.com/pretyman/glfw/archive/master.tar.gz"
    SHA1
    8c77e15354587fe3af2e65431f0808c91b6ee6b9
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(GLFW)
hunter_download(PACKAGE_NAME GLFW)

