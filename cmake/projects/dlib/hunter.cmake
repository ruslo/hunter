# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "19.2-p1"
    URL
    "https://github.com/hunter-packages/dlib/archive/v19.2-p1.tar.gz"
    SHA1
    fec7fdc72c42c5bc1ca466f9be325594921a80c8
)

hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "19.0-p3"
    URL
    "https://github.com/hunter-packages/dlib/archive/v19.0-p3.tar.gz"
    SHA1
    9671c304c770b580921a6aba7287a92cf5db5417
)

hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "19.0-p2"
    URL
    "https://github.com/hunter-packages/dlib/archive/v19.0-p2.tar.gz"
    SHA1
    549550ab2da038b32eca3e0247c0da4f0df253df
)

hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "19.0-p1"
    URL
    "https://github.com/hunter-packages/dlib/archive/v19.0-p1.tar.gz"
    SHA1
    54277a21da96f9aa0ff3b977815195e500c23410
)

hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "18.17-p1"
    URL
    "https://github.com/hunter-packages/dlib/archive/v18.17-p1.tar.gz"
    SHA1
    f7e4ae452c277b84b378769c06dd8d164a7cc149
)

hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "18.14-p1"
    URL
    "https://github.com/hunter-packages/dlib/archive/v18.14-p1.tar.gz"
    SHA1
    bf73cd97ab81162e085d06f1b4595902abe5a436
)


hunter_cmake_args(
    dlib
    CMAKE_ARGS
      DLIB_HEADER_ONLY=ON #all previous builds were header on, so that is the default
      DLIB_ENABLE_ASSERTS=OFF #must be set on/off or debug/release build will differ and config will not match one
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dlib)
hunter_download(PACKAGE_NAME dlib)
