# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SOBER_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SOBER_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_package)
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

# Dependencies
hunter_add_package(CppNetlibUri)
hunter_add_package(JsonSpirit)
hunter_add_package(Sugar)
# -- end

hunter_add_version_start(Sober)

hunter_add_version(
    PACKAGE_NAME
    Sober
    VERSION
    "0.0.1"
    URL
    "https://github.com/ruslo/sober/archive/v0.0.1.tar.gz"
    SHA1
    326987c0807ff7e8caa851476bbd57d0d01604e0
)

hunter_pick_scheme(
     DEFAULT
     url_sha1_release_debug
     COMBINED
     url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME Sober)
