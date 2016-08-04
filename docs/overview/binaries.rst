.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. spelling::

  armv

Binaries from server
--------------------

Hunter has internal mechanism of saving binaries of installed packages along
with meta information about toolchain, build options and dependencies.
This allow to not trigger same build on creation of new root directory.
For example when user change version of ``OpenSSL`` from ``1.0.1`` to ``1.0.2``
it does affect ``Config-ID`` so new root will be created. But it will not affect
how ``GTest`` builds (if it's not a dependency) so ``GTest`` archive can be
unpacked from cache. Such cache can be used locally or uploaded to server.

.. seealso::

  * `Uploading binaries to server <https://github.com/ruslo/hunter/wiki/Uploading-binaries-to-server>`_

Details
=======

Default server with binaries is
`ingenue/hunter-cache <https://github.com/ingenue/hunter-cache>`__.
Archives saved as assets to `cache tag <https://github.com/ingenue/hunter-cache/releases/tag/cache>`__.
Uploaded packages can be found by ``upload.*`` query on page with branches:

* `ingenue/hunter@upload. <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=upload.>`__

Note that some toolchains may not work for the specific packages. Check
status in job details. E.g. Qt is broken for iOS armv7s architecture, so
we have to use ``ios-*-wo-armv7s`` toolchains:

* https://travis-ci.org/ingenue/hunter/builds/140158080

Binaries/headers stored in archives. Archives are the result of packing
``CMAKE_INSTALL_PREFIX`` directory produced by
``cmake --build _builds --target install`` command. Idea is similar to CPack
functionality but extended for non-CMake packages too.

.. code-block:: shell
  :emphasize-lines: 3, 6, 8

  > mkdir temp-dir
  > cd temp-dir
  [temp-dir]> wget https://github.com/ingenue/hunter-cache/releases/download/cache/aaee852f00aa3a2a884281e8920315a77fb14465.tar.bz2
  [temp-dir]> tar xf aaee852f00aa3a2a884281e8920315a77fb14465.tar.bz2
  [temp-dir]> ls include/gtest/gtest.h
  include/gtest/gtest.h
  [temp-dir]> ls lib/libgtest.a
  lib/libgtest.a
