# Copyright (c) 2013-2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_OPENSSL_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_OPENSSL_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.2f"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2f.tar.gz"
    SHA1
    f50af5c7c2f36e7aa4637b678ba137df58e318bc
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.2e"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2e.tar.gz"
    SHA1
    889483954383738cf8dcdf2945e151c9374f7631
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.2d"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2d.tar.gz"
    SHA1
    a233de65e91dc176f4e34be03899ae00eb1dd029
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1e"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1e.tar.gz"
    SHA1
    4e8e2b21899f0dab567def50680dfd02a7acbb1a
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1d"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1d.tar.gz"
    SHA1
    d427eaf3e7e399f7f5562e00eebd6f2412903339
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.0k"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_0k.tar.gz"
    SHA1
    84c6ebb9f57af00c4eb7c34d40c97b5d61273037
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "0.9.8y"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_0_9_8y.tar.gz"
    SHA1
    b485a818490bd2818b7e948b26656c11fea77782
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1f"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1f.tar.gz"
    SHA1
    f0141b0e8cab4f18bc5d1771fb3ab02f0ae92302
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1h"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1h.tar.gz"
    SHA1
    58425104412760c3ec2e4ba8e363da5beb443fde
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1i"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1i.tar.gz"
    SHA1
    e4b0f6f98128716788e974a7b60178900a7cf5ec
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.1j"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_1j.tar.gz"
    SHA1
    38b73471e1fcc1edb7ab3e18cc59286116c1de5c
)

hunter_add_version(
    PACKAGE_NAME
    OpenSSL
    VERSION
    "1.0.2a"
    URL
    "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2a.tar.gz"
    SHA1
    072cf2bc8e19c7c59a42e7e20977fe3037c9c9f3
)

hunter_pick_scheme(
    DEFAULT
    url_sha1_openssl
    IPHONEOS
    url_sha1_openssl_ios
    WINDOWS
    url_sha1_openssl_windows
)

hunter_download(PACKAGE_NAME OpenSSL)
