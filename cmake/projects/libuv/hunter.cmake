# libuv

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# List of versions here...
hunter_add_version(
  PACKAGE_NAME
  libuv
  VERSION
  2.0.0
  URL
  https://github.com/hunter-packages/libuv/archive/v2.0.0-hunter-release.tar.gz
  SHA1
  60dee8435f4c4136a2ecb6814a2f302641ef1093
  )

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
hunter_cacheable(libuv)
hunter_download(PACKAGE_NAME libuv)
