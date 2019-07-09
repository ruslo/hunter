# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ncursesw
    VERSION
    6.1
    URL
    "https://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz"
    SHA1
    57acf6bc24cacd651d82541929f726f4def780cc
)

hunter_configuration_types(ncursesw CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    ncursesw
    CMAKE_ARGS
        EXTRA_FLAGS=--enable-ext-mouse --enable-sigwinch --enable-ext-colors --enable-widec --enable-pc-files
        PKGCONFIG_EXPORT_TARGETS=ncursesw;formw;ncurses++w;menuw;panelw
)
hunter_cacheable(ncursesw)
hunter_download(
    PACKAGE_NAME ncursesw
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    lib/pkgconfig/ncursesw.pc
    lib/pkgconfig/formw.pc
    lib/pkgconfig/ncurses++w.pc
    lib/pkgconfig/menuw.pc
    lib/pkgconfig/panelw.pc
    bin/ncursesw6-config
)
