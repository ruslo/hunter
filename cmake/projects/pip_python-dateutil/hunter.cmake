# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# Error while using GitHub release:
#
#   Make sure you're either building from a fully intact git repository or
#   PyPI tarballs. Most other sources (such as GitHub's tarballs, a git
#   checkout without the .git folder) don't contain the necessary metadata
#   and will not work.

hunter_add_version(
    PACKAGE_NAME
    pip_python-dateutil
    VERSION
    2.8.0
    URL
    "https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c/python-dateutil-2.8.0.tar.gz"
    SHA1
    140cbe261ba86ff30970bd8ca3326f543de91e4d
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_python-dateutil)
hunter_download(PACKAGE_NAME pip_python-dateutil)
