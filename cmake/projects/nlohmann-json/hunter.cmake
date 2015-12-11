if(DEFINED HUNTER_CMAKE_PROJECTS_NLOHMANN_JSON_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_NLOHMANN_JSON_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME nlohmann-json
    VERSION "1.0.0-rc1-hunter-2"
    URL "https://github.com/hunter-packages/json/archive/v1.0.0-rc1-hunter-2.tar.gz"
    SHA1 2db824ca17678c8918575bbab982e6ae93283433 
)

hunter_add_version(
    PACKAGE_NAME nlohmann-json
    VERSION "1.0.0-rc1-hunter-3"
    URL "https://github.com/hunter-packages/json/archive/v1.0.0-rc1-hunter-3.tar.gz"
    SHA1 4f0300ebb08b28ac6bca0f947ffd6afde64386ef
)

hunter_cmake_args(nlohmann-json CMAKE_ARGS JSON_BUILD_TESTS=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME nlohmann-json)
