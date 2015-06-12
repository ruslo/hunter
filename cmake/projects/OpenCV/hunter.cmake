# Copyright (c) 2015, David Hirvonen
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_OPENCV_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_OPENCV_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_package)
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    OpenCV
    VERSION
    "3.0.0-p0"
    URL
    "https://github.com/headupinclouds/opencv/archive/3.0.0-p0.tar.gz"
    SHA1
    bd69a9b3f28e7d5131402e2c3566734b4fd517aa
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV
    VERSION
    "3.0.0-rc1-p0"
    URL
    "https://github.com/hunter-packages/opencv/archive/3.0.0-rc1-p0.tar.gz"
    SHA1
    e04591de27a049851dcd69e42d649e9492c0fd90
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV
    VERSION
    "3.0.0-beta-p2"
    URL
    "https://github.com/hunter-packages/opencv/archive/3.0.0-beta-p2.tar.gz"
    SHA1
    4bac251a2f12df627a8b4b3275025d15238f900c
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV
    VERSION
    "3.0.0-beta"
    URL
    "https://github.com/Itseez/opencv/archive/3.0.0-beta.tar.gz"
    SHA1
    560895197d1a61ed88fab9ec791328c4c57c0179
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV
    VERSION
    "2.4.11-p1"
    URL
    "https://github.com/hunter-packages/opencv/archive/2.4.11-p1.tar.gz"
    SHA1
    44107ad0619b52f1f1a6b084e06915472a7b0de3
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV
    VERSION
    "2.4.11"
    URL
    "https://github.com/Itseez/opencv/archive/2.4.11.tar.gz"
    SHA1
    310a8b0fdb9bf60c6346e9d073ed2409cd1e26b4
)

hunter_add_version(
    PACKAGE_NAME
    OpenCV
    VERSION
    "2.4.10"
    URL
    "https://github.com/Itseez/opencv/archive/2.4.10.tar.gz"
    SHA1
    a0c2d5944364fc4f26b6160b33c03082b1fa08c1
)

string(COMPARE EQUAL "${CMAKE_OSX_SYSROOT}" "iphoneos" _is_ios)

if(_is_ios)
  set(_ios_args ENABLE_NEON=ON)
else()
  set(_ios_args "")
endif()

if(ANDROID)
  set(_android_args 
    ENABLE_NEON=ON
    BUILD_ANDROID_SERVICE=OFF
    BUILD_ANDROID_EXAMPLES=OFF
    )
else()
  set(_android_args "")
endif()

hunter_cmake_args(
    OpenCV
    CMAKE_ARGS
        BUILD_ANDROID_EXAMPLES=OFF
        BUILD_DOCS=OFF
        BUILD_EXAMPLES=OFF
        BUILD_PERF_TESTS=OFF
        BUILD_TESTS=OFF
        BUILD_opencv_apps=OFF
        INSTALL_PYTHON_EXAMPLES=OFF
        ${_ios_args}
        ${_android_args}
        # Find packages in Hunter (instead of building from OpenCV sources)
        BUILD_ZLIB=OFF
        BUILD_TIFF=OFF
        BUILD_PNG=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be built:
# Two versions of library will be built:
#     * libexample_A.a
#     * libexample_Ad.a

hunter_cacheable(OpenCV)
hunter_download(PACKAGE_NAME OpenCV)
