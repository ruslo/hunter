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


hunter_add_version(
    PACKAGE_NAME
    libsodium
    VERSION
    "1.0.16"
    URL
    "https://github.com/jedisct1/libsodium/archive/1.0.16.tar.gz"
    SHA1
    18a2c5758aaf60c0abbc0e6a21f63df80faccfc6
)

hunter_add_version(
    PACKAGE_NAME
    libsodium
    VERSION
    "1.0.16-p0"
    URL
    "https://github.com/hunter-packages/libsodium/archive/v1.0.16-p0.tar.gz"
    SHA1
    d986ca5b9759d6518df26248f03db44d4dc9f590
)

string(COMPARE EQUAL "${HUNTER_libsodium_VERSION}" "1.0.10" __is_1_0_10)
string(COMPARE EQUAL "${HUNTER_libsodium_VERSION}" "1.0.16" __is_1_0_16)

if(__is_1_0_10 OR __is_1_0_16)
  hunter_configuration_types(libsodium CONFIGURATION_TYPES Release)
  if(MSVC)
    hunter_pick_scheme(DEFAULT url_sha1_libsodium_msbuild)
  else()
    hunter_pick_scheme(DEFAULT url_sha1_libsodium_autogen_autotools)
  endif()
else()
    hunter_pick_scheme(DEFAULT url_sha1_cmake)
endif()

hunter_cacheable(libsodium)
hunter_download(
    PACKAGE_NAME libsodium
    PACKAGE_INTERNAL_DEPS_ID "1"
)
