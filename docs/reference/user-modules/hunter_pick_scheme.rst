.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

hunter_pick_scheme
------------------

* `Source <https://github.com/ruslo/hunter/blob/master/cmake/modules/hunter_pick_scheme.cmake>`__
* `Example <https://github.com/ruslo/hunter/blob/master/cmake/projects/OpenSSL/hunter.cmake>`__

This command used to pick a
`build scheme <https://github.com/ruslo/hunter/wiki/dev.build.schemes>`__ for
current project and called before ``hunter_download`` in
``project/<ProjectName>/hunter.cmake`` module:

.. code-block:: cmake

  hunter_pick_scheme(
      DEFAULT default_scheme_name # this scheme will be used by default
      IPHONEOS ios_scheme_name # this scheme will be used to build for iOS platform
      WINDOWS windows_scheme # this scheme will be used on windows
  )

Examples:

.. code-block:: cmake

  # This is regular cmake project
  hunter_pick_scheme(DEFAULT url_sha1_cmake)

.. code-block:: cmake

  # This is no-install (unpack only) project
  hunter_pick_scheme(DEFAULT url_sha1_unpack)

.. code-block:: cmake

  # Boost bjam
  hunter_pick_scheme(
      DEFAULT url_sha1_boost_library
      IPHONEOS url_sha1_boost_ios_library
  )

.. code-block:: cmake

  # OpenSSL
  hunter_pick_scheme(
      DEFAULT url_sha1_openssl
      IPHONEOS url_sha1_openssl_ios
      WINDOWS url_sha1_openssl_windows
  )
