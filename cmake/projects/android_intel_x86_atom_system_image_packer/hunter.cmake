# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    android_intel_x86_atom_system_image_packer
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/android_intel_x86_atom_system_image_packer/archive/v1.0.0.tar.gz"
    SHA1
    fb5c8373370c41ae2291825ff03ae50fbd244b09
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(android_intel_x86_atom_system_image_packer)
hunter_download(PACKAGE_NAME android_intel_x86_atom_system_image_packer)
