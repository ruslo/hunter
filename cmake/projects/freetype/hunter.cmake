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
    "http://sourceforge.net/projects/freetype/files/freetype2/2.6.2/freetype-2.6.2.tar.bz2/download"
    SHA1
    29c22b85b77cb22cf95c13e7062e21f39fe6b17a
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(freetype)
hunter_download(PACKAGE_NAME freetype)
