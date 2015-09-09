# Copyright (c) 2015, Damien Buhl 
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_INTLTOOL_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_INTLTOOL_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    intltool
    VERSION
    "0.51.0"
    URL
    "https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz"
    SHA1
    a0c3bcb99d1bcfc5db70f8d848232a47c47da090
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(PACKAGE_NAME intltool)
