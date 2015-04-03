# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_DLIB_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_DLIB_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

# Print version that we are trying to download (i.e. from 'config.cmake')
hunter_add_version_start(dlib)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    dlib
    VERSION
    "18.14"
    URL
    "https://github.com/davisking/dlib/archive/v18.14.tar.gz"
    SHA1
    85db9a8107cf5f65006921783164a0b2c0f3a5c0
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_no_install) # (for cmake modules and header-only libraries)

hunter_download(PACKAGE_NAME dlib)