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
    1.0.0
    URL
    "https://github.com/taocpp/json/archive/c34d590cf319fdbf1c824eefb850b142f64f5fb3.zip"
    SHA1
    669d0118cb39b0c214836a4652ce854e324927f9
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
    PACKAGE_INTERNAL_DEPS_ID "1"
)
