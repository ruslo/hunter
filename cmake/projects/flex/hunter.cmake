# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    flex
    VERSION
    "2.6.4"
    URL
    "https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz"
    SHA1
    fafece095a0d9890ebd618adb1f242d8908076e1
)

hunter_configuration_types(flex CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_flex_autotools)
hunter_cacheable(flex)
hunter_download(PACKAGE_NAME flex
                PACKAGE_INTERNAL_DEPS_ID "1")
