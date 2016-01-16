# This is a header-like file, so include guards needed
if(DEFINED HUNTER_CMAKE_PROJECTS_GOOGLETEST_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_GOOGLETEST_HUNTER_CMAKE_ 1)
endif()

# In Contrast to the standard package that is included in hunter, this package includes GTest AND GMock


# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
  PACKAGE_NAME
  GoogleTest
  VERSION
  1.8.0-hunter-p0
  URL
  "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p0.tar.gz"
  SHA1
  f4f8d3a70be157519abb1299b172713357063e90
)


# Probably more versions for real packages...

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
# Two versions of library will be build by default:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME GoogleTest)

