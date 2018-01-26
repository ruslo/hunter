# Copyright (c) 2016, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.7.0-p4
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.7.0-p4.tar.gz"
    SHA1
    40b8b7d4ee7e3a8e96a52283e6a5b6a9a91865a4
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.7.0-p3
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.7.0-p3.tar.gz"
    SHA1
    7ebadc3214efedced7efa9eb1d79428595bf6b36
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.7.0-p2
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.7.0-p2.tar.gz"
    SHA1
    3dd1b94b940548e69ff9be5453af80e011a5a080    
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.7.0-p1
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.7.0-p1.tar.gz"
    SHA1
    8d8f8597aa5464be7af52e36a20321e5ece1e84a
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.7.0-p0
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.7.0-p0.tar.gz" 
    SHA1
    fc3f861acd16599b38d0c84a071f3098f9b1f629
)
  
hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.40-p9
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.40-p9.tar.gz"
    SHA1
    040000efe20018fcfcd2acc318cf36eb5dcb1b1d
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.40-p5
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.40-p5.tar.gz"
    SHA1
    14586ddbc9c4cd6b90d0e0afba2e443446c39f4c
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.40-p4
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.40-p4.tar.gz"
    SHA1
    8fc127f73f387e292b725e19a32291e0fef012d7
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.40-p3
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.40-p3.tar.gz"
    SHA1
    2949041288fca9a5fd6e42f38de83aad2b31b27d
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.40-p2
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.40-p2.tar.gz"
    SHA1
    dc1e21d0b023df87915c0140999286afed064c50
)

hunter_add_version(
    PACKAGE_NAME
    xgboost
    VERSION
    0.40-p10
    URL
    "https://github.com/hunter-packages/xgboost/archive/v0.40-p10.tar.gz"
    SHA1
    d51da15945bd10e964384278862473ad8e5dcbc7
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(xgboost)
hunter_download(PACKAGE_NAME xgboost)
