include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME autoutils
  VERSION "0.1.0"
  URL "https://github.com/isaachier/autoutils/archive/v0.1.0.tar.gz"
  SHA1 "5e7a54fe584a6055e54fd4e6fcfc6de1e458eb07")

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(autoutils)
hunter_download(PACKAGE_NAME autoutils)
