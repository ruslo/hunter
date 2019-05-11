# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_boto3
    VERSION
    1.9.130
    URL
    "https://github.com/boto/boto3/archive/1.9.130.tar.gz"
    SHA1
    8a10d9204be8d3903ccf62b5a1db6204336a52d4
)

set(
    __hunter_boto3_deps
    pip_botocore
    pip_jmespath
    pip_python-dateutil
    pip_six
    pip_urllib3
)

hunter_cmake_args(
    pip_boto3
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=${__hunter_boto3_deps}
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_boto3)
hunter_download(PACKAGE_NAME pip_boto3)
