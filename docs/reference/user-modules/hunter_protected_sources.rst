.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

hunter_protected_sources
------------------------

.. warning::

  This feature implemented only for build schemes:

  * ``url_sha1_cmake``
  * ``url_sha1_unpack``

If package has sources protected by password you should use
``hunter_protected_sources`` to mark it so:

.. code-block:: cmake
  :emphasize-lines: 3, 7

  # cmake/projects/Foo/hunter.cmake

  include(hunter_protected_sources)

  # ...

  hunter_protected_sources(Foo)
  hunter_download(PACKAGE_NAME Foo)

.. note::

  * The word "sources" is important here since binaries from cache can be
    shared or private. E.g. if you upload the binaries produced by **private
    package** to the **public binaries server** then users can download
    **binaries** without specifying any credentials.

.. seealso::

  * :doc:`Protected sources </user-guides/cmake-user/protected-sources>`
