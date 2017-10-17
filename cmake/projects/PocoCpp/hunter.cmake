include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    PocoCpp
    VERSION
    1.7.9-p0
    URL
    "https://github.com/hunter-packages/poco/archive/v1.7.9-p0.zip"
    SHA1
    1ad6193edd0dbd67c351af7458b464252baf5bb3
)

hunter_add_version(
    PACKAGE_NAME
    PocoCpp
    VERSION
    1.7.8-p0
    URL
    "https://github.com/hunter-packages/poco/archive/v1.7.8-p0.zip"
    SHA1
    229dd0f6c3696c2ab0c7b4449b664a75c2211188
)

hunter_add_version(
    PACKAGE_NAME
    PocoCpp
    VERSION
    1.7.6-p0
    URL
    "https://github.com/hunter-packages/poco/archive/v1.7.6-p0.zip"
    SHA1
    a4b577d4fd6907c87d20dff31fa5caf4bd94bc89
)

hunter_add_version(
    PACKAGE_NAME
    PocoCpp
    VERSION
    1.7.3
    URL
    "https://github.com/pocoproject/poco/archive/poco-1.7.3-release.zip"
    SHA1
    22dcb34d85d2cbf2ce71fd84b28489c99ed112d0
)

hunter_add_version(
    PACKAGE_NAME
    PocoCpp
    VERSION
    1.7.4
    URL
    "https://github.com/pocoproject/poco/archive/poco-1.7.4-release.zip"
    SHA1
    f392b87edb5bbc2b44aa08cfd72d87da8cc8661f
)

hunter_cmake_args(
    PocoCpp
    CMAKE_ARGS
        CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP=TRUE
        POCO_STATIC=ON
        ENABLE_CPPUNIT=OFF
        ENABLE_MONGODB=OFF
        ENABLE_NETSSL=OFF
        ENABLE_CRYPTO=OFF
        ENABLE_DATA=OFF
        ENABLE_PAGECOMPILER=OFF
        ENABLE_PAGECOMPILER_FILE2PAGE=OFF
        ENABLE_REDIS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(PocoCpp)
hunter_download(PACKAGE_NAME PocoCpp)
