# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_QTCMAKEEXTRA_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_QTCMAKEEXTRA_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.0.tar.gz"
    SHA1
    8657b0878e22a17c046917517dc149657dac3d75
)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.1"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.1.tar.gz"
    SHA1
    cb76d1d7156bf2f79afaef87ffb4502b2fcc1a6e
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(QtCMakeExtra)
hunter_download(PACKAGE_NAME QtCMakeExtra)
