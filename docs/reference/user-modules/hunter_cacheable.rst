.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

hunter_cacheable
----------------

This command will give permission to package so it can be saved in cache.
Usually each root ``<hunter-id>/<config-id>/<toolchain-id>`` directory can be
shared between unlimited number of projects but need to build from scratch
every time. Binary cache allow to save builds in cache directory and share this
cache between several ``<hunter-id>/<config-id>/<toolchain-id>`` roots. Note
that all dependencies of this package and the package itself must be
`relocatable <https://github.com/ruslo/hunter/wiki/usr.adding.new.package#important>`__.

.. code-block:: cmake

  # cmake/project/TIFF/hunter.cmake
  hunter_cacheable(TIFF)
  hunter_download(PACKAGE_NAME TIFF)

Messages in logs:

* successful build of cacheable package:

.. code-block:: none

  -- [hunter] Cache saved: /.../.hunter/_Base/Cache/raw/752c8b96f5613ee865c0cda5f3306d67e463a977.tar.bz2

* successful cache look-up (reuse/unpacked from cache):

.. code-block:: none

  -- [hunter] Cache HIT: TIFF
