# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_package)
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_report_broken_package)
include(hunter_check_toolchain_definition)

# Use *.7z version.
# Qt 5.5 overview:
#   zip 540M
#   tar.gz 436M (don't have qtbase/configure.exe)
#   7z 297M
#   tar.xz 305M (don't have qtbase/configure.exe)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.0"
    URL
    "http://download.qt.io/official_releases/qt/5.5/5.5.0/single/qt-everywhere-opensource-src-5.5.0.7z"
    SHA1
    df2c0a7a20f219f921246b260df086600515955d
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.0-hunter-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.0-p0/hunter-5.5.0.7z"
    SHA1
    a54e70921daba9dada49a2f0f05ce49a062d9d86
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.0-hunter-p1"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.0-p1/hunter-5.5.0.7z"
    SHA1
    b9f2a7bcb865bdeea51e1151f8d08c6a8c81e88a
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-hunter-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-p0/hunter-5.5.1.7z"
    SHA1
    629170a8af91610c246ad27df56aa5afb687e7fd
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-hunter-p1"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-p1/v5.5.1-p1.7z"
    SHA1
    8485a9ecece177c9cc4369dc4bd4d726d4c60302
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-hunter-p2"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-p2/hunter-5.5.1.7z"
    SHA1
    5e4dbc4e453f4fa8a43188c9d2dfd461adc0e26d
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-p0/v5.5.1-cvpixelbuffer-p0.7z"
    SHA1
    6c077023b0b8a7402f04a46c5b90d4db99d74369
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p0/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    4efb6c9c37db1846ec70f5fdcf2c719087451075
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p1"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p1/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    2e2b765388d365987e70e0214a7a8b1f47fe0552
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p2"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p2/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    1371bf9115360bc4830f49f4095cce783d57c6ed
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p3"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p3/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    e5175d2a169e5ec2c22f5983eb4f4cd114c39a99
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p4"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p4/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    25b54fb50292f28b76d0631a9e5c791e01bf3c45
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p5"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p5/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    4d4caf96c2f78f4c15c242f74513107a241f8c2c
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p6"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p6/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    96c56491d6228eb131f9c11c00b894f00e76e3d6
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p7"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p7/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    4219da1cc7d14bfdd59bcbecf9180c2133181e52
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p8"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p8/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    130b210eff2a29b2aa65421e23ec618b65aa5d0f
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.5.1-cvpixelbuffer-2-p9"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.5.1-cvpixelbuffer-2-p9/hunter-5.5.1-cvpixelbuffer-2.7z"
    SHA1
    da8682218c7ed731d1affbdd1abee3c7393fb3e7
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.6.0-alpha"
    URL
    "http://download.qt.io/development_releases/qt/5.6/5.6.0-alpha/single/qt-everywhere-opensource-src-5.6.0-alpha.7z"
    SHA1
    d902b7df94219d2ed2f5c868839c85ce9daa056a
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.9.1-p0"
    URL
    "https://github.com/hunter-packages/Qt/releases/download/v5.9.1-p0/hunter-5.9.1.7z"
    SHA1
    b1bc254e688426316b55115adddd13e4a10115b2
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.10.1"
    URL
    "http://download.qt.io/official_releases/qt/5.10/5.10.1/single/qt-everywhere-src-5.10.1.tar.xz"
    SHA1
    3d71e887287bdea664ac6f8db4aaa4a7d913be59
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.11.1"
    URL
    "http://download.qt.io/official_releases/qt/5.11/5.11.1/single/qt-everywhere-src-5.11.1.tar.xz"
    SHA1
    0ac866442a960d4038a51ba3096b2cc5d796b5ee
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.11.3"
    URL
    "https://download.qt.io/official_releases/qt/5.11/5.11.3/single/qt-everywhere-src-5.11.3.tar.xz"
    SHA1
    3f6c0df4fa7524ed11557ed55db35ef551cd2782
)

hunter_add_version(
    PACKAGE_NAME
    Qt
    VERSION
    "5.12.3"
    URL
    "https://download.qt.io/official_releases/qt/5.12/5.12.3/single/qt-everywhere-src-5.12.3.tar.xz"
    SHA1
    cf1bbdf0e69a651a67738e9b3e616e0dd9cf3087
)

hunter_cacheable(Qt)

if(NOT APPLE AND NOT WIN32)
  hunter_configuration_types(Qt CONFIGURATION_TYPES Release)
endif()

if(ANDROID)
  # Static variant is not supported: https://bugreports.qt.io/browse/QTBUG-47455
  hunter_cmake_args(Qt CMAKE_ARGS BUILD_SHARED_LIBS=ON)
endif()

if(IOS)
  list(FIND IPHONEOS_ARCHS "armv7s" _armv7s_index)
  if(NOT _armv7s_index EQUAL -1)
    hunter_report_broken_package(
        "Some parts of Qt can't be built for armv7s."
        "For example Qt Multimedia: https://bugreports.qt.io/browse/QTBUG-48805"
    )
  endif()
endif()

if(CMAKE_VERSION VERSION_LESS 3.6)
  # QtCMakeExtra modules (https://github.com/hunter-packages/QtCMakeExtra) installed
  # near the Qt CMake modules and loaded by `file(GLOB)`:
  # * https://github.com/qt/qtbase/blob/441ad9b938d453ccf5bff8867e7d3e6e432f9eba/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in#L352
  #
  # Before CMake 3.6 file(GLOB) order is not predictable and QtCMakeExtra will not work
  # because they are expected to load last.
  #
  # file(GLOB) sorted since CMake 3.6:
  # * https://gitlab.kitware.com/cmake/cmake/commit/edcccde7d65944b3744c4567bd1d452211829702
  hunter_report_broken_package(
      "CMake 3.6+ expected for Qt package (current version is ${CMAKE_VERSION}."
  )
endif()

if(MSVC)
  hunter_check_toolchain_definition(NAME "_DLL" DEFINED _hunter_vs_md)
  hunter_cmake_args(
    Qt
    CMAKE_ARGS
      QT_BUILD_DYNAMIC_VSRUNTIME=${_hunter_vs_md}
  )
endif()

include("${CMAKE_CURRENT_LIST_DIR}/qtbase/hunter.cmake")

hunter_add_package(QtCMakeExtra)
