# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_LEATHERS_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LEATHERS_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_package)
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

# Dependencies --
hunter_add_package(Boost)
# -- end

hunter_add_version_start(Leathers)

hunter_add_version(
    PACKAGE_NAME
    Leathers
    VERSION
    "0.1.0"
    URL
    "https://github.com/ruslo/leathers/archive/v0.1.0.tar.gz"
    SHA1
    dc914aca55469c275cf59d23ddd95b7054d02420
)

hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug
    COMBINED
    url_sha1_combined_release_debug
)

hunter_download(PACKAGE_NAME Leathers)
