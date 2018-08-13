# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    ctti
    VERSION
    "0.0.2"
    URL
   "https://github.com/hunter-packages/ctti/archive/0.0.2.tar.gz"
    SHA1
    20858e749b12505863f57e4b5c2e7852b3ea9027
)

hunter_cmake_args(
    ctti
    CMAKE_ARGS
        CTTI_BUILD_TESTS=OFF
        CTTI_BUILD_EXAMPLES=OFF
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ctti)
hunter_download(PACKAGE_NAME ctti)
