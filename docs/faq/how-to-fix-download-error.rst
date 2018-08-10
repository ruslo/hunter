.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

How to fix download error?
--------------------------

Unsupported protocol
====================

Most sources downloaded by HTTPS protocol so CMake should be build with
CURL with enabled OpenSSL. Without HTTPS support you will see this error:

.. code-block:: none

  error: downloading
  'https://...' failed

    status_code: 1
    status_string: "Unsupported protocol"
    log: Protocol "https" not supported or disabled in libcurl

  Closing connection -1

.. note::

  * `Example of building CMake with CURL + OpenSSL <https://github.com/ruslo/hunter/issues/328#issuecomment-198672048>`__

You can check that everything is fine by invoking this script:

.. code-block:: cmake

  # script.cmake

  cmake_minimum_required(VERSION 3.2)

  file(
      DOWNLOAD
      "https://github.com/ruslo/hunter/archive/v0.23.13.tar.gz"
      "${CMAKE_CURRENT_LIST_DIR}/hunter-archive.tar.gz"
      EXPECTED_HASH SHA1=ef7d6ac5a4ba88307b2bea3e6ed7206c69f542e8
      SHOW_PROGRESS
      TLS_VERIFY ON
  )

.. code-block:: none

  > cmake -P script.cmake

TLS issues
==========

.. admonition:: TODO

  Real fix instructions here

If you have any problems with TLS verification you can suppress TLS checks
by setting :ref:`HUNTER_TLS_VERIFY <hunter tls verify>` to ``OFF``.
