# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# https://dri.freedesktop.org/libdrm/
hunter_add_version(
    PACKAGE_NAME
    drm
    VERSION
    "2.4.67"
    URL
    "https://dri.freedesktop.org/libdrm/libdrm-2.4.67.tar.bz2"
    SHA1
    21d43437219ddd1e409fb4b7d77254cd129e8075
)

hunter_pick_scheme(DEFAULT drm)
hunter_cacheable(drm)
hunter_download(
    PACKAGE_NAME drm
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libdrm.la"
    "lib/libdrm_amdgpu.la"
    "lib/libdrm_nouveau.la"
    "lib/libdrm_radeon.la"
    "lib/libkms.la"
    "lib/pkgconfig/libdrm.pc"
    "lib/pkgconfig/libdrm_amdgpu.pc"
    "lib/pkgconfig/libdrm_intel.pc"
    "lib/pkgconfig/libdrm_nouveau.pc"
    "lib/pkgconfig/libdrm_radeon.pc"
    "lib/pkgconfig/libkms.pc"
)
