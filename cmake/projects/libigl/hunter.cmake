# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# Tags v1.3.3 and v2.0.0 are the same:
# - https://github.com/hunter-packages/libigl/pull/1#issuecomment-495176368
hunter_add_version(
    PACKAGE_NAME
    libigl
    VERSION
    2.0.0-e33f534-p0
    URL
    "https://github.com/hunter-packages/libigl/archive/v1.3.3-e33f534-p0.tar.gz"
    SHA1
    b94120a61fd5c6320edc7a79f14a37877527767d
)

hunter_add_version(
    PACKAGE_NAME
    libigl
    VERSION
    2.0.0-e33f534-p1
    URL
    "https://github.com/hunter-packages/libigl/archive/v1.3.3-e33f534-p1.tar.gz"
    SHA1
    24637b17fb4700db898099fb6f21e8425ea08a30
)

hunter_cmake_args(
    libigl
    CMAKE_ARGS
        # LIBIGL_USE_STATIC_LIBRARY=OFF means make it an INTERFACE library
        LIBIGL_USE_STATIC_LIBRARY=ON
        LIBIGL_BUILD_TESTS=OFF
        LIBIGL_BUILD_TUTORIALS=OFF
        LIBIGL_BUILD_PYTHON=OFF
        LIBIGL_WITH_COMISO=OFF
        LIBIGL_WITH_EMBREE=OFF
        LIBIGL_WITH_OPENGL=OFF
        LIBIGL_WITH_OPENGL_GLFW=OFF
        LIBIGL_WITH_OPENGL_GLFW_IMGUI=OFF
        LIBIGL_WITH_PNG=OFF
        LIBIGL_WITH_TETGEN=OFF
        LIBIGL_WITH_TRIANGLE=OFF
        LIBIGL_WITH_XML=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libigl)
hunter_download(PACKAGE_NAME libigl)
