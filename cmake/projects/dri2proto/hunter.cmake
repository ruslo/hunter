# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/individual/proto/
hunter_add_version(
    PACKAGE_NAME
    dri2proto
    VERSION
    "2.8"
    URL
    "http://www.x.org/releases/individual/proto/dri2proto-2.8.tar.bz2"
    SHA1
    2bc4e8f00778b1f3fe58b4c4f93607ac2adafbbf
)

hunter_configuration_types(dri2proto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(dri2proto)
hunter_download(
    PACKAGE_NAME dri2proto
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/dri2proto.pc"
)
