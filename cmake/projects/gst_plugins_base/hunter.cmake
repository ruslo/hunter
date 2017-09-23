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
    gst_plugins_base
    VERSION
    1.10.4
    URL
    "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.10.4.tar.xz"
    SHA1
    c6749d515d49373f2e04e7a87f5fc5bcfa16d7ef
)

set(
    _gst_export_components
    allocators
    app
    audio
    fft
    pbutils
    plugins-base
    riff
    rtp
    rtsp
    sdp
    tag
    video
)

set(_gst_export_targets "")
foreach(_x ${_gst_export_components})
  list(APPEND _gst_export_targets gstreamer-${_x}-1.0)
endforeach()

hunter_cmake_args(
    gst_plugins_base
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=gstreamer;libogg;x11
    DEPENDS_ON_PKGCONFIGS=gstreamer-1.0
    PKGCONFIG_EXPORT_TARGETS=${_gst_export_targets}
)

hunter_configuration_types(gst_plugins_base CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(gst_plugins_base)

hunter_download(
    PACKAGE_NAME
    gst_plugins_base
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/gstreamer-1.0/libgstadder.la"
    "lib/gstreamer-1.0/libgstapp.la"
    "lib/gstreamer-1.0/libgstaudioconvert.la"
    "lib/gstreamer-1.0/libgstaudiorate.la"
    "lib/gstreamer-1.0/libgstaudioresample.la"
    "lib/gstreamer-1.0/libgstaudiotestsrc.la"
    "lib/gstreamer-1.0/libgstencodebin.la"
    "lib/gstreamer-1.0/libgstgio.la"
    "lib/gstreamer-1.0/libgstogg.la"
    "lib/gstreamer-1.0/libgstplayback.la"
    "lib/gstreamer-1.0/libgstsubparse.la"
    "lib/gstreamer-1.0/libgsttcp.la"
    "lib/gstreamer-1.0/libgsttypefindfunctions.la"
    "lib/gstreamer-1.0/libgstvideoconvert.la"
    "lib/gstreamer-1.0/libgstvideorate.la"
    "lib/gstreamer-1.0/libgstvideoscale.la"
    "lib/gstreamer-1.0/libgstvideotestsrc.la"
    "lib/gstreamer-1.0/libgstvolume.la"
    "lib/gstreamer-1.0/libgstximagesink.la"
    "lib/libgstallocators-1.0.la"
    "lib/libgstapp-1.0.la"
    "lib/libgstaudio-1.0.la"
    "lib/libgstfft-1.0.la"
    "lib/libgstpbutils-1.0.la"
    "lib/libgstriff-1.0.la"
    "lib/libgstrtp-1.0.la"
    "lib/libgstrtsp-1.0.la"
    "lib/libgstsdp-1.0.la"
    "lib/libgsttag-1.0.la"
    "lib/libgstvideo-1.0.la"
    "lib/pkgconfig/gstreamer-allocators-1.0.pc"
    "lib/pkgconfig/gstreamer-app-1.0.pc"
    "lib/pkgconfig/gstreamer-audio-1.0.pc"
    "lib/pkgconfig/gstreamer-fft-1.0.pc"
    "lib/pkgconfig/gstreamer-pbutils-1.0.pc"
    "lib/pkgconfig/gstreamer-plugins-base-1.0.pc"
    "lib/pkgconfig/gstreamer-riff-1.0.pc"
    "lib/pkgconfig/gstreamer-rtp-1.0.pc"
    "lib/pkgconfig/gstreamer-rtsp-1.0.pc"
    "lib/pkgconfig/gstreamer-sdp-1.0.pc"
    "lib/pkgconfig/gstreamer-tag-1.0.pc"
    "lib/pkgconfig/gstreamer-video-1.0.pc"
)
