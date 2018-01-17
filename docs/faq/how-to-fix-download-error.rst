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

TLS issues
==========

.. admonition:: TODO

  Real fix instructions here

If you have any problems with TLS verification you can suppress TLS checks
by setting :ref:`HUNTER_TLS_VERIFY <hunter tls verify>` to ``OFF``.
