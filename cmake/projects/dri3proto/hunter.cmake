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
    dri3proto
    VERSION
    "1.0"
    URL
    "http://www.x.org/releases/individual/proto/dri3proto-1.0.tar.bz2"
    SHA1
    1007eaa2f83022653a224f7d2e676ea51cba2f2b
)

hunter_configuration_types(dri3proto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(dri3proto)
hunter_download(
    PACKAGE_NAME dri3proto
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/dri3proto.pc"
)
