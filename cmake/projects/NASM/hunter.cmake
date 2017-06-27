# Copyright (c) 2017, Zhuhao Wang
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_configuration_types)

if(MINGW)
  # NASM only supports a subset of VS compilers on Windows. 
  hunter_add_version(
    PACKAGE_NAME
    NASM
    VERSION
    "2.12.02"
    URL
    "http://www.nasm.us/pub/nasm/releasebuilds/2.12.02/win32/nasm-2.12.02-win32.zip"
    SHA1
    07d7c742dcc1107d7a322db7a3a19065d7d1cbb4
    )
else()
  hunter_add_version(
    PACKAGE_NAME
    NASM
    VERSION
    "2.12.02"
    URL
    "http://www.nasm.us/pub/nasm/releasebuilds/2.12.02/nasm-2.12.02.tar.gz"
    SHA1
    6d23d4be63f3a73d7df3053e65168f7906dd99e7
    )
endif()

if(MINGW OR MSYS)
  hunter_pick_scheme(DEFAULT url_sha1_unpack_bin_install)
elseif(CMAKE_HOST_WIN32)
  hunter_pick_scheme(DEFAULT url_sha1_nasm_windows)
  hunter_cacheable(NASM)
else()
  hunter_configuration_types(NASM CONFIGURATION_TYPES Release)
  hunter_pick_scheme(DEFAULT url_sha1_autotools)
  hunter_cacheable(NASM)
endif()

hunter_download(PACKAGE_NAME NASM)

