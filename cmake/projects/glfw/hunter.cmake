# Copyright (c) 2016, Alexandre Pretyman
# All rights reserved.

include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    glfw
    VERSION
    "3.2-p0"
    URL
    "https://github.com/hunter-packages/glfw/archive/3.2-p0.tar.gz"
    SHA1
    90f91bab3020db15a0fc07c27c53095fa2dbf1b3
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(glfw)
hunter_download(
    PACKAGE_NAME glfw
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/glfw3.pc"
)

