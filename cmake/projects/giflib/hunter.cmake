# Copyright (c) 2017, Stephane Garagnani
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    giflib
    VERSION
    "5.1.4"
    URL
    "https://10gbps-io.dl.sourceforge.net/project/giflib/giflib-5.1.4.tar.bz2"
    SHA1
    5f1157cfc377916280849e247b8e34fa0446513f
)

hunter_configuration_types(giflib CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(giflib)
hunter_download(
    PACKAGE_NAME giflib
)
