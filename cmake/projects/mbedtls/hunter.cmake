include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    mbedtls
    VERSION
    2.5.1
    URL
    "https://github.com/ARMmbed/mbedtls/archive/mbedtls-2.5.1.zip"
    SHA1
    4ac770929ce476aa5c2cc5ce1aac853104299b47
)

hunter_add_version(
    PACKAGE_NAME
    mbedtls
    VERSION
    2.5.0
    URL
    "https://github.com/ARMmbed/mbedtls/archive/mbedtls-2.5.0.zip"
    SHA1
    6ab2a89b92ade6a7876a2de742813536bd58b236
)

hunter_cmake_args(
    mbedtls
    CMAKE_ARGS
        ENABLE_TESTING=OFF
        ENABLE_PROGRAMS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mbedtls)
hunter_download(PACKAGE_NAME mbedtls)
