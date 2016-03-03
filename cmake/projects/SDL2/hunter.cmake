if(DEFINED HUNTER_CMAKE_PROJECTS_SDL2_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_SDL2_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SDL2
    VERSION
    "2.0.0"
    URL
    "https://libsdl.org/release/SDL2-2.0.0.tar.gz"
    SHA1
    a907eb5203abad6649c1eae0120d96c0a1931350
)


hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME SDL2)
