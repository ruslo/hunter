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
    gst_plugins_bad
    VERSION
    1.10.4
    URL
    "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.10.4.tar.xz"
    SHA1
    97ac75ee92e37cdff75298cd98ce29b8b0c2b5c7
)

set(
    _gstreamer_components
    bad-audio
    bad-base
    bad-video
    codecparsers
    insertbin
    mpegts
    player
    plugins-bad
)

set(_gstreamer_pkg "")
foreach(_x ${_gstreamer_components})
  list(APPEND _gstreamer_pkg gstreamer-${_x}-1.0)
endforeach()

hunter_cmake_args(
    gst_plugins_bad
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=gst_plugins_base
    DEPENDS_ON_PKGCONFIGS=gstreamer-plugins-base-1.0 # ???
    PKGCONFIG_EXPORT_TARGETS=${_gstreamer_pkg}
)

hunter_configuration_types(gst_plugins_bad CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(gst_plugins_bad)

hunter_download(
    PACKAGE_NAME
    gst_plugins_bad
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/gstreamer-1.0/libgstaccurip.la"
    "lib/gstreamer-1.0/libgstadpcmdec.la"
    "lib/gstreamer-1.0/libgstadpcmenc.la"
    "lib/gstreamer-1.0/libgstaiff.la"
    "lib/gstreamer-1.0/libgstasfmux.la"
    "lib/gstreamer-1.0/libgstaudiofxbad.la"
    "lib/gstreamer-1.0/libgstaudiomixer.la"
    "lib/gstreamer-1.0/libgstaudiovisualizers.la"
    "lib/gstreamer-1.0/libgstautoconvert.la"
    "lib/gstreamer-1.0/libgstbayer.la"
    "lib/gstreamer-1.0/libgstbz2.la"
    "lib/gstreamer-1.0/libgstcamerabin2.la"
    "lib/gstreamer-1.0/libgstcoloreffects.la"
    "lib/gstreamer-1.0/libgstcompositor.la"
    "lib/gstreamer-1.0/libgstdataurisrc.la"
    "lib/gstreamer-1.0/libgstdebugutilsbad.la"
    "lib/gstreamer-1.0/libgstdecklink.la"
    "lib/gstreamer-1.0/libgstdvb.la"
    "lib/gstreamer-1.0/libgstdvbsuboverlay.la"
    "lib/gstreamer-1.0/libgstdvdspu.la"
    "lib/gstreamer-1.0/libgstfbdevsink.la"
    "lib/gstreamer-1.0/libgstfestival.la"
    "lib/gstreamer-1.0/libgstfieldanalysis.la"
    "lib/gstreamer-1.0/libgstfreeverb.la"
    "lib/gstreamer-1.0/libgstfrei0r.la"
    "lib/gstreamer-1.0/libgstgaudieffects.la"
    "lib/gstreamer-1.0/libgstgdp.la"
    "lib/gstreamer-1.0/libgstgeometrictransform.la"
    "lib/gstreamer-1.0/libgsthls.la"
    "lib/gstreamer-1.0/libgstid3tag.la"
    "lib/gstreamer-1.0/libgstinter.la"
    "lib/gstreamer-1.0/libgstinterlace.la"
    "lib/gstreamer-1.0/libgstivfparse.la"
    "lib/gstreamer-1.0/libgstivtc.la"
    "lib/gstreamer-1.0/libgstjp2kdecimator.la"
    "lib/gstreamer-1.0/libgstjpegformat.la"
    "lib/gstreamer-1.0/libgstmidi.la"
    "lib/gstreamer-1.0/libgstmpegpsdemux.la"
    "lib/gstreamer-1.0/libgstmpegpsmux.la"
    "lib/gstreamer-1.0/libgstmpegtsdemux.la"
    "lib/gstreamer-1.0/libgstmpegtsmux.la"
    "lib/gstreamer-1.0/libgstmxf.la"
    "lib/gstreamer-1.0/libgstnetsim.la"
    "lib/gstreamer-1.0/libgstpcapparse.la"
    "lib/gstreamer-1.0/libgstpnm.la"
    "lib/gstreamer-1.0/libgstrawparse.la"
    "lib/gstreamer-1.0/libgstremovesilence.la"
    "lib/gstreamer-1.0/libgstrfbsrc.la"
    "lib/gstreamer-1.0/libgstrtponvif.la"
    "lib/gstreamer-1.0/libgstsdpelem.la"
    "lib/gstreamer-1.0/libgstsegmentclip.la"
    "lib/gstreamer-1.0/libgstshm.la"
    "lib/gstreamer-1.0/libgstsiren.la"
    "lib/gstreamer-1.0/libgstsmooth.la"
    "lib/gstreamer-1.0/libgstspeed.la"
    "lib/gstreamer-1.0/libgststereo.la"
    "lib/gstreamer-1.0/libgstsubenc.la"
    "lib/gstreamer-1.0/libgsttimecode.la"
    "lib/gstreamer-1.0/libgstvcdsrc.la"
    "lib/gstreamer-1.0/libgstvideofiltersbad.la"
    "lib/gstreamer-1.0/libgstvideoframe_audiolevel.la"
    "lib/gstreamer-1.0/libgstvideoparsersbad.la"
    "lib/gstreamer-1.0/libgstvideosignal.la"
    "lib/gstreamer-1.0/libgstvmnc.la"
    "lib/gstreamer-1.0/libgsty4mdec.la"
    "lib/gstreamer-1.0/libgstyadif.la"
    "lib/libgstadaptivedemux-1.0.la"
    "lib/libgstbadaudio-1.0.la"
    "lib/libgstbadbase-1.0.la"
    "lib/libgstbadvideo-1.0.la"
    "lib/libgstbasecamerabinsrc-1.0.la"
    "lib/libgstcodecparsers-1.0.la"
    "lib/libgstinsertbin-1.0.la"
    "lib/libgstmpegts-1.0.la"
    "lib/libgstphotography-1.0.la"
    "lib/libgstplayer-1.0.la"
    "lib/libgsturidownloader-1.0.la"
    "lib/pkgconfig/gstreamer-bad-audio-1.0.pc"
    "lib/pkgconfig/gstreamer-bad-base-1.0.pc"
    "lib/pkgconfig/gstreamer-bad-video-1.0.pc"
    "lib/pkgconfig/gstreamer-codecparsers-1.0.pc"
    "lib/pkgconfig/gstreamer-insertbin-1.0.pc"
    "lib/pkgconfig/gstreamer-mpegts-1.0.pc"
    "lib/pkgconfig/gstreamer-player-1.0.pc"
    "lib/pkgconfig/gstreamer-plugins-bad-1.0.pc"
)
