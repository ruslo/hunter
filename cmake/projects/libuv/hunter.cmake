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
  https://github.com/hunter-packages/libuv/archive/hunter-v2.0.0.tar.gz
  SHA1
  e3ece2f45a83854dc42e80ce874edf28453b7622
  )

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

# Download package.
hunter_cacheable(libuv)
hunter_download(PACKAGE_NAME libuv)
