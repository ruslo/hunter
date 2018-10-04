# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    botan
    VERSION
    2.11.0-110af9494
    URL
    "https://github.com/randombit/botan/archive/110af949412e7c4b28b447a3600a947ddf2a2f2f.zip"
    SHA1
    b97b5a934c872310992635a2ef5d016e1e59a2dd
)

hunter_add_version(
    PACKAGE_NAME
    botan
    VERSION
    2.11.0
    URL
    "https://github.com/randombit/botan/archive/2.11.0.tar.gz"
    SHA1
    f9667a53c19a7eb8999f3580baf21dc29c6a5f33
)

hunter_add_version(
    PACKAGE_NAME
    botan
    VERSION
    2.10.0
    URL
    "https://github.com/randombit/botan/archive/2.10.0.tar.gz"
    SHA1
    6e6b0e4a4b5a69ff42de2dfec2cd998a981abd2d
)

hunter_cmake_args(
    botan
    CMAKE_ARGS
      WITH_BZIP2=NO
      WITH_ZLIB=NO
      PKGCONFIG_EXPORT_TARGETS=botan-2
)

hunter_configuration_types(botan CONFIGURATION_TYPES Release)

if(MINGW)
  hunter_pick_scheme(DEFAULT url_sha1_botan)
elseif(WIN32)
  hunter_pick_scheme(DEFAULT url_sha1_botan_win)
elseif(APPLE)
  if(IOS)
    hunter_pick_scheme(DEFAULT url_sha1_botan_ios)
  else()
    hunter_pick_scheme(DEFAULT url_sha1_botan_macos)
  endif()
else()
  hunter_pick_scheme(DEFAULT url_sha1_botan)
endif()

hunter_cacheable(botan)
hunter_download(PACKAGE_NAME botan
  PACKAGE_UNRELOCATABLE_TEXT_FILES
  lib/pkgconfig/botan-2.pc
)
