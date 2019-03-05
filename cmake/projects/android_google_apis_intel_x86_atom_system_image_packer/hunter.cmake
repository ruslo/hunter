# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    android_google_apis_intel_x86_atom_system_image_packer
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/android_google_apis_intel_x86_atom_system_image_packer/archive/v1.0.0.tar.gz"
    SHA1
    beb881562b055e0c6a050f26c5f14512793e9330
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(android_google_apis_intel_x86_atom_system_image_packer)
hunter_download(PACKAGE_NAME android_google_apis_intel_x86_atom_system_image_packer)
