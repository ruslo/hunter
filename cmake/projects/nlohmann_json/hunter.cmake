# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

if(MSVC AND MSVC_VERSION LESS 1900)
    hunter_report_broken_package(
        "The 'nlohmann_json' library cannot be used with Visual Studio < 2015."
        "This is due to the missing implementation of the 'noexcept' keyword."
    )
endif()

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "2.1.1-p0"
    URL "https://github.com/hunter-packages/json/archive/v2.1.1-p0.tar.gz"
    SHA1 baf11b83387a7c4b2b6eb1e280f69084185813c0
)

hunter_add_version(
    PACKAGE_NAME nlohmann_json
    VERSION "2.1.1-p1"
    URL "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz"
    SHA1 28ec11ef2596d38a11a2f4b3dfd63c3255c76f57
)

hunter_cmake_args(nlohmann_json CMAKE_ARGS JSON_BuildTests=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nlohmann_json)
hunter_download(PACKAGE_NAME nlohmann_json)
