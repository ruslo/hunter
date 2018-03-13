# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
  PACKAGE_NAME
  chaiscript
  VERSION
  "v6.0.0"
  URL
  https://github.com/hunter-packages/ChaiScript/archive/v6.0.0.zip
  SHA1
  007c2b38f726576be2b9f7e614155153503c659e
  )

hunter_cmake_args(
    chaiscript
    CMAKE_ARGS
        BUILD_TESTING=OFF
)


hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(chaiscript)
hunter_download(PACKAGE_NAME chaiscript)

