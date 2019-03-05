.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. spelling::

  armv

Binaries from server
--------------------

Hunter has an internal mechanism that saves the binaries of installed packages along
with meta-data about the toolchain, build options, and dependencies.
This allows Hunter to avoid triggering the same build when a new root directory is created.
For example, when a user changes the version of ``OpenSSL`` from ``1.0.1`` to ``1.0.2``
it will affect ``Config-ID``, so a new root will be created. However, it will not affect
how ``GTest`` builds (if it's not a dependency), so the ``GTest`` archive can be
unpacked from the local cache. The cache can be kept local or uploaded to a Hunter cache server.


.. seealso::

  * :ref:`Uploading to server <uploading to server>`

Details
=======

The default server with cached binaries is
`ingenue/hunter-cache <https://github.com/ingenue/hunter-cache>`__.
Archives are saved as GitHub `release assets <https://github.com/ingenue/hunter-cache/releases>`__
and each is associated with a git `tag <https://github.com/ingenue/hunter-cache/tags>`__.
Available packages can be queried using an ``upload.*`` HTTP query from the GitHub branches URL:

* `ingenue/hunter@upload. <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=upload.>`__

Note that some toolchains may not work for specific packages. Check the
status in the Travis CI job details. For example, Qt is broken for the iOS armv7s architecture, so
we have to use the ``ios-*-wo-armv7s`` toolchains:

* https://travis-ci.org/ingenue/hunter/builds/140158080

Binaries/headers are stored in archives and archives are the result of packing the
``CMAKE_INSTALL_PREFIX`` directory produced by the
``cmake --build _builds --target install`` command. The idea is similar to CPack
functionality but is extended for non-CMake packages too.

.. code-block:: none
  :emphasize-lines: 3, 6, 8

  > mkdir temp-dir
  > cd temp-dir
  [temp-dir]> wget https://github.com/ingenue/hunter-cache/releases/download/cache/aaee852f00aa3a2a884281e8920315a77fb14465.tar.bz2
  [temp-dir]> tar xf aaee852f00aa3a2a884281e8920315a77fb14465.tar.bz2
  [temp-dir]> ls include/gtest/gtest.h
  include/gtest/gtest.h
  [temp-dir]> ls lib/libgtest.a
  lib/libgtest.a
