# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_decorator
    VERSION
    4.4.0
    URL
    # GitHub is missing 4.4.0 release: https://github.com/micheles/decorator/releases
    "https://files.pythonhosted.org/packages/ba/19/1119fe7b1e49b9c8a9f154c930060f37074ea2e8f9f6558efc2eeaa417a2/decorator-4.4.0.tar.gz"
    SHA1
    de59d002bcf83b16421e6ea6fe40256b5fccedad
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_decorator)
hunter_download(PACKAGE_NAME pip_decorator)
