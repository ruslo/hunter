if(DEFINED HUNTER_CMAKE_PROJECTS_PCRE_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_PCRE_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME pcre
    VERSION "8.38-rc1-hunter-1"
    URL "https://github.com/daminetreg/pcre/archive/8.38-rc1-hunter-1.tar.gz"
    SHA1 186abc10c47b34db9d1cc63cfc907a3b925bf1d8 
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME pcre)
