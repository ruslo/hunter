# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_EIGEN_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_EIGEN_HUNTER_CMAKE_ 1)
endif()

# Load used modules
include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_add_package)

# Print version that we are trying to download (i.e. from 'config.cmake')
hunter_add_version_start(Eigen)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.2.4"
    URL
    "https://bitbucket.org/eigen/eigen/get/3.2.4.tar.gz"
    SHA1
    b826f665bdfe31784795eef79c75540db71ab702
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
hunter_download(PACKAGE_NAME Eigen)