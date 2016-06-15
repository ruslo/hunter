include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

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
