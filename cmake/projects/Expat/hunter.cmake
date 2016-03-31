
# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Expat
    VERSION
    "2.1.0"
    URL
    "https://downloads.sourceforge.net/expat/expat-2.1.0.tar.gz"
    SHA1
    b08197d146930a5543a7b99e871cba3da614f6f0
)

hunter_cmake_args(
  Expat
  CMAKE_ARGS
    BUILD_tools=OFF
    BUILD_examples=OFF
    BUILD_tests=OFF
    BUILD_shared=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Expat)
