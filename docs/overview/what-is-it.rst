.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

What is it?
-----------

Every Hunter `release`_ (`Atom feed`_) archive is a meta-package with build
instructions and URLs of real packages.  Archive will be downloaded and
unpacked automatically by ``HunterGate`` CMake module. You only need to set
``URL`` and ``SHA1``:

.. code-block:: cmake
  :emphasize-lines: 2-3

  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.14.5.tar.gz"
      SHA1 "f2c3de6d13baf8c5d2aa77bdc47c516e668c677e"
  )

Here is content of the archive in simplified form:

.. code-block:: none

  Hunter (0.14.15) = {
      Boost (1.60.0, 1.59.0, 1.58.0-p1, ...),
      GTest (1.7.0, ...),
      OpenCV (3.0.0-beta, 2.4.11, 2.4.10, ...),
      OpenSSL (1.0.2g, 1.0.2f, 1.0.2e, ...),
      ...
  }

If you download and unpack it you can view some internals. Let's see OpenSSL
package properties:

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: download-start
  :end-before: # doc: download-end

`hunter.cmake`_ holds list of available versions:

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: version-start
  :end-before: # doc: version-end

.. code-block:: shell

      VERSION
      "1.0.2g"
      URL
      "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2g.tar.gz"
  --
      VERSION
      "1.0.2f"
      URL
      "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2f.tar.gz"
  --
      VERSION
      "1.0.2e"
      URL
      "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2e.tar.gz"

Install instructions from build scheme `url_sha1_openssl.cmake.in`_:

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: install-start
  :end-before: # doc: install-end

.. code-block:: none

  INSTALL_COMMAND
  make install_sw

Default version from `default.cmake`_
(is customizable, see :ref:`Config-ID <config-id>`):

.. literalinclude:: what-is-it.sh
  :language: shell
  :start-after: # doc: default-start
  :end-before: # doc: default-stop

.. code-block:: cmake

  hunter_config(OpenSSL VERSION 1.0.2g)

.. seealso::

  * :doc:`Detailed sources layout </reference/layouts/sources>`
  * :doc:`Creating version on the fly from Git submodule </user-guides/hunter-user/git-submodule>`

.. _release: https://github.com/ruslo/hunter/releases
.. _Atom feed: https://github.com/ruslo/hunter/releases.atom
.. _default.cmake: https://github.com/ruslo/hunter/blob/master/cmake/configs/default.cmake
.. _hunter.cmake: https://github.com/ruslo/hunter/blob/master/cmake/projects/OpenSSL/hunter.cmake
.. _url_sha1_openssl.cmake.in: https://github.com/ruslo/hunter/blob/master/cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in
