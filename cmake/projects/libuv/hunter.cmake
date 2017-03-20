# libuv

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
  PACKAGE_NAME
  libuv
  VERSION
  1.8.0
  URL
  https://github.com/akalsi87/libuv-cmake/archive/libuv-cmake-1.8.0.tar.gz
  SHA1
  946506fd09fdf6ee8bccba7828dce6642f575d9d
  )

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
hunter_download(PACKAGE_NAME libuv)
