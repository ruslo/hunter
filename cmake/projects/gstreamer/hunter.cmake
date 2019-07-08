# Copyright (c) 2017 Ruslan Baratov
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
    gstreamer
    VERSION
    "1.10.4"
    URL
    "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.4.tar.xz"
    SHA1
    217f56f474b1a89fdd27c8025a3eee7a7cd13559
)

hunter_configuration_types(gstreamer CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)

hunter_cmake_args(
    gstreamer
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=glib
    DEPENDS_ON_PKGCONFIGS=glib-2.0
    PKGCONFIG_EXPORT_TARGETS=gstreamer-1.0
)

hunter_cacheable(gstreamer)
hunter_download(
    PACKAGE_NAME gstreamer
    PACKAGE_INTERNAL_DEPS_ID "5"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/gstreamer-1.0/libgstcoreelements.la"
    "lib/gstreamer-1.0/libgstcoretracers.la"
    "lib/libgstbase-1.0.la"
    "lib/libgstcheck-1.0.la"
    "lib/libgstcontroller-1.0.la"
    "lib/libgstnet-1.0.la"
    "lib/libgstreamer-1.0.la"
    "lib/pkgconfig/gstreamer-1.0.pc"
    "lib/pkgconfig/gstreamer-base-1.0.pc"
    "lib/pkgconfig/gstreamer-check-1.0.pc"
    "lib/pkgconfig/gstreamer-controller-1.0.pc"
    "lib/pkgconfig/gstreamer-net-1.0.pc"
)
