# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_CVMATIO_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_CVMATIO_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

hunter_add_package(OpenCV)

# Print version that we are trying to download (i.e. from 'config.cmake')
hunter_add_version_start(cvmatio)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    cvmatio
    VERSION
    "1.0.0"
    URL
    "https://github.com/headupinclouds/cvmatio/archive/v1.0.0.tar.gz"
    SHA1
    7b3d34b4cef81616071839453089941db958f1ca
)

# Pick a download scheme
hunter_pick_scheme(
    DEFAULT
    url_sha1_release_debug # For separate release/debug generators, like Makefile
    COMBINED
    url_sha1_combined_release_debug # For Xcode and Visual Studio
)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME cvmatio)