# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    taocpp-json
    VERSION
    1.0.0-beta.11-e0895587
    URL
    "https://github.com/taocpp/json/archive/e08955875acc5853d31aa5ccd4b918726d20847f.zip"
    SHA1
    916357f4325fa15de32ba15f3b78e89d6308b920
)

hunter_cmake_args(
   taocpp-json
   CMAKE_ARGS
      TAOCPP_JSON_BUILD_TESTS=OFF
      TAOCPP_JSON_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(taocpp-json)
hunter_download(
    PACKAGE_NAME taocpp-json
)
