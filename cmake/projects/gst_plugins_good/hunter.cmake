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
    gst_plugins_good
    VERSION
    1.10.4
    URL
    "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.10.4.tar.xz"
    SHA1
    6ff3f3a7facae861c7687f27055fd9ced7c7fe10
)

hunter_cmake_args(
    gst_plugins_good
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=gst_plugins_base;xext;Jpeg
    DEPENDS_ON_PKGCONFIGS=gstreamer-plugins-base-1.0 # ???
)

hunter_configuration_types(gst_plugins_good CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(gst_plugins_good)

hunter_download(
    PACKAGE_NAME
    gst_plugins_good
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/gstreamer-1.0/libgstalaw.la"
    "lib/gstreamer-1.0/libgstalpha.la"
    "lib/gstreamer-1.0/libgstalphacolor.la"
    "lib/gstreamer-1.0/libgstapetag.la"
    "lib/gstreamer-1.0/libgstaudiofx.la"
    "lib/gstreamer-1.0/libgstaudioparsers.la"
    "lib/gstreamer-1.0/libgstauparse.la"
    "lib/gstreamer-1.0/libgstautodetect.la"
    "lib/gstreamer-1.0/libgstavi.la"
    "lib/gstreamer-1.0/libgstcutter.la"
    "lib/gstreamer-1.0/libgstdebug.la"
    "lib/gstreamer-1.0/libgstdeinterlace.la"
    "lib/gstreamer-1.0/libgstdtmf.la"
    "lib/gstreamer-1.0/libgsteffectv.la"
    "lib/gstreamer-1.0/libgstequalizer.la"
    "lib/gstreamer-1.0/libgstflv.la"
    "lib/gstreamer-1.0/libgstflxdec.la"
    "lib/gstreamer-1.0/libgstgoom.la"
    "lib/gstreamer-1.0/libgstgoom2k1.la"
    "lib/gstreamer-1.0/libgsticydemux.la"
    "lib/gstreamer-1.0/libgstid3demux.la"
    "lib/gstreamer-1.0/libgstimagefreeze.la"
    "lib/gstreamer-1.0/libgstinterleave.la"
    "lib/gstreamer-1.0/libgstisomp4.la"
    "lib/gstreamer-1.0/libgstjpeg.la"
    "lib/gstreamer-1.0/libgstlevel.la"
    "lib/gstreamer-1.0/libgstmatroska.la"
    "lib/gstreamer-1.0/libgstmulaw.la"
    "lib/gstreamer-1.0/libgstmultifile.la"
    "lib/gstreamer-1.0/libgstmultipart.la"
    "lib/gstreamer-1.0/libgstnavigationtest.la"
    "lib/gstreamer-1.0/libgstoss4audio.la"
    "lib/gstreamer-1.0/libgstossaudio.la"
    "lib/gstreamer-1.0/libgstreplaygain.la"
    "lib/gstreamer-1.0/libgstrtp.la"
    "lib/gstreamer-1.0/libgstrtpmanager.la"
    "lib/gstreamer-1.0/libgstrtsp.la"
    "lib/gstreamer-1.0/libgstshapewipe.la"
    "lib/gstreamer-1.0/libgstsmpte.la"
    "lib/gstreamer-1.0/libgstspectrum.la"
    "lib/gstreamer-1.0/libgstudp.la"
    "lib/gstreamer-1.0/libgstvideo4linux2.la"
    "lib/gstreamer-1.0/libgstvideobox.la"
    "lib/gstreamer-1.0/libgstvideocrop.la"
    "lib/gstreamer-1.0/libgstvideofilter.la"
    "lib/gstreamer-1.0/libgstvideomixer.la"
    "lib/gstreamer-1.0/libgstwavenc.la"
    "lib/gstreamer-1.0/libgstwavparse.la"
    "lib/gstreamer-1.0/libgsty4menc.la"
)
