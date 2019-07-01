# Copyright (c) 2016-2017, Ruslan Baratov
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
    glib
    VERSION
    2.54.0
    URL
    "https://download.gnome.org/sources/glib/2.54/glib-2.54.0.tar.xz"
    SHA1
    96b434a9ca142344b93f38ed0cd88d36196b68ae
)

hunter_configuration_types(glib CONFIGURATION_TYPES Release)

hunter_cmake_args(
    glib
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=libffi;util_linux;libpcre;ZLIB
    DEPENDS_ON_PKGCONFIGS=libffi;blkid;fdisk;mount;smartcols;uuid;libpcre;libpcrecpp;libpcreposix
    PKGCONFIG_EXPORT_TARGETS=glib-2.0
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(glib)
hunter_download(
    PACKAGE_NAME glib
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "bin/glib-gettextize"
    "lib/libgio-2.0.la"
    "lib/libglib-2.0.la"
    "lib/libgmodule-2.0.la"
    "lib/libgobject-2.0.la"
    "lib/libgthread-2.0.la"
    "lib/pkgconfig/gio-2.0.pc"
    "lib/pkgconfig/gio-unix-2.0.pc"
    "lib/pkgconfig/glib-2.0.pc"
    "lib/pkgconfig/gmodule-2.0.pc"
    "lib/pkgconfig/gmodule-export-2.0.pc"
    "lib/pkgconfig/gmodule-no-export-2.0.pc"
    "lib/pkgconfig/gobject-2.0.pc"
    "lib/pkgconfig/gthread-2.0.pc"
)
