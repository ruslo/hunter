include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    soil
    VERSION
    1.0.4
    URL
    "https://github.com/frequem/Simple-OpenGL-Image-Library/archive/v1.0.4.tar.gz"
    SHA1
    b973e0c0ebf461abd897eb2c2dbf5590a01ef7a4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(soil)
hunter_download(PACKAGE_NAME soil)
