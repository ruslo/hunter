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
    Tesseract
    VERSION
    "3.05.01-hunter-3"
    URL
    "https://github.com/hunter-packages/tesseract/archive/v3.05.01-hunter-3.tar.gz"
    SHA1
    0ccf9537a17634448618b21d3fd26537a26b94ae
)

if(ANDROID OR MINGW)
    hunter_cmake_args(
        Tesseract
        CMAKE_ARGS
            Tesseract_USE_OPENCL=OFF
)
endif()


hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Tesseract)
hunter_download(PACKAGE_NAME Tesseract)
