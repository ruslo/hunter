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

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.2"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.2.tar.gz"
    SHA1
    395b70cbff78844a5b9021f6530332e5dff6fc08
)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.3"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.3.tar.gz"
    SHA1
    a4a7393fbb07620fc4568a61cbc967a8ae1d6d4b
)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.4"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.4.tar.gz"
    SHA1
    feb981e0d523f275a185984817d73c9f631b4de3
)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.5"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.5.tar.gz"
    SHA1
    cbe5154c8641fae6a21269f07e8e270aeca45f6f
)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.6"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.6.tar.gz"
    SHA1
    c1b2e289b952525ff4162e1570527bebe131aa7f
)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.7"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.7.tar.gz"
    SHA1
    4c112972b0b609dbd27555f2dfe5ca2ce23f1d24
)

hunter_add_version(
    PACKAGE_NAME
    QtCMakeExtra
    VERSION
    "1.0.8"
    URL
    "https://github.com/hunter-packages/QtCMakeExtra/archive/v1.0.8.tar.gz"
    SHA1
    398ad520975b3e5e16d8aa38bafd2155f27403c0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(QtCMakeExtra)
hunter_download(PACKAGE_NAME QtCMakeExtra)
