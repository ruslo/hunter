# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.2.7
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.2.7.tar.gz"
    SHA1
    3a2f944abf86007b563f3f4fd16bb3dd1e53c5b6    
    )

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.2.6
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.2.6.tar.gz"
    SHA1
    9cbb696e74df2ef358bd11bd8503a9783ec8f188
    )

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.2.5
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.2.5.tar.gz"
    SHA1
    d6b3f57470effbfe6b89678144272f22923597db
    )

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.2.4
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.2.4.tar.gz"
    SHA1
    ce38c35533fbb8f8efc30eb74d300598ee2132aa
    )

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.6-p3
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.6-p3.tar.gz"
    SHA1
    3ddef5cd88ae26776e86e5d0d0cf637d06a88d1f
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.6-p2
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.6-p2.tar.gz"
    SHA1
    23b5729b77def9a633b01689ac97821bf11b413b
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.6-p1
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.6-p1.tar.gz"
    SHA1
    b6b2cc03f49dabf0dd72a09b6c760164f6fb6e10
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.6
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.6.tar.gz"
    SHA1
    dd6a039cbfb0f240ed29211f9e606703ee79a355
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.4
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.4.tar.gz"
    SHA1
    636f2fb45c45e4ab22a7d60dabe1816df561a5b0
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.3
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.3.tar.gz"
    SHA1
    1025b418b9a949ed8885d4ab1872d7a7b77c3b03
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.2
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.2.tar.gz"
    SHA1
    a007c80de2d92147d6172ed52820e0c1268ed429
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.1
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.1.tar.gz"
    SHA1
    3b9b76a5af9e8eb206cfaa4503b954ec87cb5c7c
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.2.1
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.2.1.tar.gz"
    SHA1
    373a66b1149b1b563f65195c6767ba4ee7a0b9ed
)

hunter_cmake_args(ogles_gpgpu CMAKE_ARGS OGLES_GPGPU_INSTALL=ON)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ogles_gpgpu)
hunter_download(PACKAGE_NAME ogles_gpgpu)
