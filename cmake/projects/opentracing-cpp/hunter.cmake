# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME opentracing-cpp
    VERSION "1.0.0"
    URL "https://github.com/hunter-packages/opentracing-cpp/archive/hunter-v1.0.0.tar.gz"
    SHA1 "881faab1353be98f605534d2777349eb5cbbe6be")

hunter_add_version(
    PACKAGE_NAME opentracing-cpp
    VERSION "1.1.0"
    URL "https://github.com/opentracing/opentracing-cpp/archive/v1.1.0.tar.gz"
    SHA1 "800c98b4b049a89e9e38a34d797b42d470476e1d")

hunter_add_version(
    PACKAGE_NAME opentracing-cpp
    VERSION "1.2.0"
    URL "https://github.com/opentracing/opentracing-cpp/archive/v1.2.0.tar.gz"
    SHA1 "5f95ff287a03948c48a572de1d11d5cb0d055662")

hunter_add_version(
    PACKAGE_NAME opentracing-cpp
    VERSION "1.3.0"
    URL "https://github.com/opentracing/opentracing-cpp/archive/v1.3.0.tar.gz"
    SHA1 "7329f65e48e3c2e7c1bdd95683f4433c34649bfc")

hunter_add_version(
    PACKAGE_NAME opentracing-cpp
    VERSION "1.4.0"
    URL "https://github.com/opentracing/opentracing-cpp/archive/v1.4.0.tar.gz"
    SHA1 "cddf6a6c13a9167cd05715a07e14e9bcff71e11b")

hunter_add_version(
    PACKAGE_NAME opentracing-cpp
    VERSION "1.4.2"
    URL "https://github.com/opentracing/opentracing-cpp/archive/v1.4.2.tar.gz"
    SHA1 "2785569bda67f654ff9cacc97124fd59f3161fb4")

hunter_cmake_args(opentracing-cpp CMAKE_ARGS
    BUILD_TESTING=OFF ENABLE_LINTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(opentracing-cpp)
hunter_download(PACKAGE_NAME opentracing-cpp)
