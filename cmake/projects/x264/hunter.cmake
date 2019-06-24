# Copyright (c) 2017 Alexandre Pretyman
# All rights reserved.

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    x264
    VERSION
    "snapshot-20170420-2245"
    URL
    "ftp://ftp.videolan.org/pub/x264/snapshots/x264-snapshot-20170420-2245.tar.bz2"
    SHA1
    679b8c4f39f375090bf64e5c80c83303e4ddc37c
)

hunter_add_version(
    PACKAGE_NAME
    x264
    VERSION
    "snapshot-20190513-2245"
    URL
    "https://download.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-20190513-2245-stable.tar.bz2"
    SHA1
    2e6faf305fb48a1449bdb61fe219b0c4d9501c36
)

hunter_configuration_types(x264 CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_x264)
hunter_cmake_args(x264 CMAKE_ARGS PKGCONFIG_EXPORT_TARGETS=x264)
hunter_cacheable(x264)
hunter_download(
    PACKAGE_NAME x264
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/x264.pc"
)
