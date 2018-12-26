# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    aws-c-common
    VERSION
	0.2.1
    URL
    "https://github.com/insufficientchocolate/aws-c-common/archive/hunter-0.2.1.tar.gz"
    SHA1
	d01faf7011670635af49262cd47270096c3c002d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aws-c-common)
hunter_download(PACKAGE_NAME aws-c-common)
