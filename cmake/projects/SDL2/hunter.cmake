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
    "2.0.4"
    URL
    "https://libsdl.org/release/SDL2-2.0.4.tar.gz"
    SHA1
    470a23dfc4b6220c687925ebbe5fe96287f8fb08
)

hunter_add_version(
    PACKAGE_NAME
    SDL2
    VERSION
    "2.0.3"
    URL
    "https://libsdl.org/release/SDL2-2.0.3.tar.gz"
    SHA1
    21c45586a4e94d7622e371340edec5da40d06ecc
)

hunter_add_version(
    PACKAGE_NAME
    SDL2
    VERSION
    "2.0.2"
    URL
    "https://libsdl.org/release/SDL2-2.0.2.tar.gz"
    SHA1
    304c7cd3dddca98724a3e162f232a8a8f6e1ceb3
)

hunter_add_version(
    PACKAGE_NAME
    SDL2
    VERSION
    "2.0.1"
    URL
    "https://libsdl.org/release/SDL2-2.0.1.tar.gz"
    SHA1
    0a3feb5328832f4ffcab0e128ac1aa0c0f9ba224
)

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
