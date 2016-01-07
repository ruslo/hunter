if(DEFINED HUNTER_CMAKE_PROJECTS_FREETYPE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_FREETYPE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    freetype
    VERSION
    "2.6.2"
    URL
    "https://github.com/hunter-packages/freetype/archive/hunter.tar.gz"
    SHA1
    d310255f984c3500389d3b2782ff35128f09518b
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(freetype)
hunter_download(PACKAGE_NAME freetype)
