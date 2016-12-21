# Copyright (c) 2016, Alexandre Pretyman
# All rights reserved.

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    glm
    VERSION
    "0.9.7.6"
    URL
    "https://github.com/hunter-packages/glm/archive/0.9.7.6-p0.tar.gz"
    SHA1
    6169cec7b94172141431ef4661e70a5e515c1fa6
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glm)
hunter_download(
    PACKAGE_NAME glm
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/glm.pc"
)

