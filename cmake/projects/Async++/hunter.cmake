if(DEFINED HUNTER_CMAKE_PROJECTS_EXAMPLE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_EXAMPLE_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    Async++
    VERSION
    "0.0.2-hunter"
    URL
    "https://github.com/hunter-packages/asyncplusplus/archive/v0.0.2-hunter.tar.gz"
    SHA1
    19ad060bed5addd8975f27757231ff610117aeb6
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Async++)
