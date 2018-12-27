include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    soil
    VERSION
    1.0.3
    URL
    "https://github.com/frequem/Simple-OpenGL-Image-Library/archive/v1.0.3.tar.gz"
    SHA1
    3c39ed99b538ed4c120cbcc93275b5a4614075b9
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(soil)
hunter_download(PACKAGE_NAME soil)
