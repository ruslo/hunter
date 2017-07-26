# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "2.1.1"
    URL "https://github.com/nlohmann/json/archive/v2.1.1.tar.gz"
    SHA1 abee5b79c8a04ece60c496759f4bd002e9cd5077
)


hunter_cmake_args(nlohmann_json CMAKE_ARGS JSON_BuildTests=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nlohmann_json)
hunter_download(PACKAGE_NAME nlohmann_json)
