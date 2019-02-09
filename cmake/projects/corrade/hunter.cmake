# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    corrade
    VERSION
    2019.01
    URL
    "https://github.com/mosra/corrade/archive/v2019.01.tar.gz"
    SHA1
    3be8da37331e3dd6a2fa0753a49a1c305f4b5b6a
)

hunter_add_version(
    PACKAGE_NAME
    corrade
    VERSION
    2018.10
    URL
    "https://github.com/mosra/corrade/archive/v2018.10.tar.gz"
    SHA1
    240c68bfe89a0cc86411b6854358b1607c06d90d
)

hunter_add_version(
    PACKAGE_NAME
    corrade
    VERSION
    v2018.10
    URL
    "https://github.com/mosra/corrade/archive/v2018.10.tar.gz"
    SHA1
    240c68bfe89a0cc86411b6854358b1607c06d90d
)

hunter_cmake_args(
    corrade
    CMAKE_ARGS
        # Build TestSuite library (these are not tests, but a test library)
        WITH_TESTSUITE=ON
        # Build PluginManager library
        WITH_PLUGINMANAGER=ON
        # Build Interconnect library
        WITH_INTERCONNECT=ON
        # Enable compatibility mode for MSVC 2015 (might disable some features)
        MSVC2015_COMPATIBILITY=OFF
        # Enable compatibility mode for GCC 4.7 (might disable some features)
        GCC47_COMPATIBILITY:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(corrade)
hunter_download(PACKAGE_NAME corrade)
