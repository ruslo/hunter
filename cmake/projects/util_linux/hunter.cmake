# Copyright (c) 2016 Ruslan Baratov
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
    util_linux
    VERSION
    "2.30.1"
    URL
    "https://www.kernel.org/pub/linux/utils/util-linux/v2.30/util-linux-2.30.1.tar.xz"
    SHA1
    030b92cede3d68816d3206645c4262599175ec8a
)

hunter_configuration_types(util_linux CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)

hunter_cmake_args(
    util_linux
    CMAKE_ARGS
    EXTRA_FLAGS=--disable-makeinstall-chown
    PKGCONFIG_EXPORT_TARGETS=blkid;fdisk;mount;smartcols;uuid
)

hunter_cacheable(util_linux)
hunter_download(
    PACKAGE_NAME util_linux
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libblkid.la"
    "lib/libfdisk.la"
    "lib/libmount.la"
    "lib/libsmartcols.la"
    "lib/libuuid.la"
    "lib/pkgconfig/blkid.pc"
    "lib/pkgconfig/fdisk.pc"
    "lib/pkgconfig/mount.pc"
    "lib/pkgconfig/smartcols.pc"
    "lib/pkgconfig/uuid.pc"
)
