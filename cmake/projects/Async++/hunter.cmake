if(DEFINED HUNTER_CMAKE_PROJECTS_EXAMPLE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_EXAMPLE_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    Async++
    VERSION
    "0.0.1-hunter"
    URL
    "https://github.com/alapshin/asyncplusplus/archive/v0.0.1-hunter.tar.gz"
    SHA1
    e013afbfb12e5843dc0b3d543c101ed28c325c1d
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Async++)
