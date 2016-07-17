# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_add_version(
    PACKAGE_NAME
    libsodium
    VERSION
    "1.0.10"
    URL
    "https://github.com/jedisct1/libsodium/archive/1.0.10.tar.gz"
    SHA1
    00a999629f1f8f500cef29818135f8f889f44e41
)

hunter_configuration_types(libsodium CONFIGURATION_TYPES Release)
if(MSVC)
    hunter_pick_scheme(DEFAULT url_sha1_libsodium_msbuild)
else()
    hunter_pick_scheme(DEFAULT url_sha1_libsodium_autogen_autotools)
endif()
hunter_cacheable(libsodium)
hunter_download(
    PACKAGE_NAME libsodium
    PACKAGE_INTERNAL_DEPS_ID "1"
)
