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

hunter_cmake_args(
    Urho3D
    CMAKE_ARGS
    URHO3D_ANGELSCRIPT=OFF
    URHO3D_DATABASE_ODBC=OFF
    URHO3D_DATABASE_SQLITE=OFF
    URHO3D_LUA=OFF
    URHO3D_NAVIGATION=OFF
    URHO3D_NETWORK=OFF
    URHO3D_PCH=OFF
    URHO3D_PHYSICS=ON
    URHO3D_SAMPLES=OFF
    URHO3D_URHO2D=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Urho3D)
hunter_download(PACKAGE_NAME Urho3D)
