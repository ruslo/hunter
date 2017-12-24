include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME autoutils
  VERSION "0.1.0"
  URL "https://github.com/isaachier/autoutils/archive/v0.1.0.tar.gz"
  SHA1 "901a6ccc5f9d5d89ca411d51f8706f085f3f0c11")

# Usually there is no need to specify 'LICENSE' explicitly (one of the defaults).
# Here it's used to update Hunter cache.
hunter_cmake_args(autoutils CMAKE_ARGS "HUNTER_INSTALL_LICENSE_FILES=LICENSE")

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME autoutils)
