# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
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

hunter_configuration_types(drm CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(drm_dependencies
    pciaccess
    pthread-stubs
)

hunter_cmake_args(
    drm
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${drm_dependencies}
)
hunter_cacheable(drm)
hunter_download(
    PACKAGE_NAME drm
    PACKAGE_INTERNAL_DEPS_ID "3"
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
