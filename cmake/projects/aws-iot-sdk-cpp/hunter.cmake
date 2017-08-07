include(hunter_add_version)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    aws-iot-sdk-cpp
    VERSION
    1.1.1-p0
    URL
    "https://github.com/hunter-packages/aws-iot-device-sdk-cpp/archive/v1.1.1-p0.zip"
    SHA1
    dddd7b6b93fd67c0a520f5eb56013f72dd926dea
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aws-iot-sdk-cpp)
hunter_download(PACKAGE_NAME aws-iot-sdk-cpp)
