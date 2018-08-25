# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p2
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p2.tar.gz"
    SHA1
    c828fad52e40475e34aa9829eb733dfe690b8942
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p4
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p4.tar.gz"
    SHA1
    af0daeaa7be483ed98830b5080cfab54976db47e
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p5
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p5.tar.gz"
    SHA1
    42bc93e302c8e35312fa966f4a9b1faf3ac8db7f
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p6
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p6.tar.gz"
    SHA1
    b75bc0de6ff64c403f45a39d27d60a7cd6363038
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p7
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p7.tar.gz"
    SHA1
    66b296e00edee7ba65c211a892e5ac0ae9a8877d
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p8
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p8.tar.gz"
    SHA1
    c150a5495a317ad2d92187d31388d42a8d413434
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p9
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p9.tar.gz"
    SHA1
    df696bba70384368a703c3650988e91951ce51f1
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p12
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p12.tar.gz"
    SHA1
    1c6258cce46018d8386cf836bfda8fdfbfe225f6
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p13
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p13.tar.gz"
    SHA1
    9dc5df770d7b454feb880ada76bcc0868879adfb
)

hunter_add_version(
    PACKAGE_NAME
    Urho3D
    VERSION
    1.7-p15
    URL
    "https://github.com/hunter-packages/Urho3D/archive/v1.7-p15.tar.gz"
    SHA1
    2413d786c419845fdcb062c102f810503ddd09d4
)

hunter_cmake_args(
    Urho3D
    CMAKE_ARGS
    URHO3D_ANGELSCRIPT=ON
    URHO3D_DATABASE_ODBC=OFF
    URHO3D_DATABASE_SQLITE=ON
    URHO3D_LUA=ON
    URHO3D_NAVIGATION=ON
    URHO3D_NETWORK=ON
    URHO3D_PCH=OFF
    URHO3D_PHYSICS=ON
    URHO3D_SAMPLES=OFF
    URHO3D_URHO2D=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Urho3D)
hunter_download(PACKAGE_NAME Urho3D)
