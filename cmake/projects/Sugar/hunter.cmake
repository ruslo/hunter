# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_SUGAR_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SUGAR_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)

hunter_add_version_start(Sugar)

hunter_add_version(
    PACKAGE_NAME
    Sugar
    VERSION
    "1.0.0"
    URL
    "https://github.com/ruslo/sugar/archive/v1.0.0.tar.gz"
    SHA1
    3f1360e447dd23d3db9ce010e217053deb6aebde
)

hunter_download(
    PACKAGE_NAME
    Sugar
    DOWNLOAD_SCHEME
    url_sha1_no_install
)
