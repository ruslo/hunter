# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  YAML_CPP
  VERSION
  "0.5.3"
  URL
  "https://github.com/hunter-packages/yaml-cpp/archive/release-0.5.3-hunter-p1.tar.gz"
  SHA1
  782bcc8a26adf4b5e12a77d13b54b919e55d0b3a
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(YAML_CPP)
hunter_download(PACKAGE_NAME YAML_CPP)
