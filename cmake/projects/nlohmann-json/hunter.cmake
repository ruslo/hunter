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
    VERSION "1.0.0-rc1-hunter-1"
    URL "https://github.com/daminetreg/json/archive/v1.0.0-rc1-hunter-1.tar.gz"
    SHA1 bf1c8d663c1a0aaec2f39efc29e8c56bcc7dbbd8 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME nlohmann-json)
