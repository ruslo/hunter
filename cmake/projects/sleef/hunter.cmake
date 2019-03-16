include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    sleef
    VERSION
    "3.3.1-p1"
    URL
    "https://github.com/hunter-packages/sleef/archive/v3.3.1-p1.tar.gz"
    SHA1
    f6b40d51d72dc32ef7124b3564c334da5122d9c4
)

hunter_cmake_args(
    sleef
    CMAKE_ARGS
    BUILD_GNUABI_LIBS=OFF
    BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(sleef)
hunter_download(PACKAGE_NAME sleef)
