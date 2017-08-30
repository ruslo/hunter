.. spelling::

    freetype

.. index:: graphics ; freetype

.. _pkg.freetype:

freetype
========

-  `Official <http://www.freetype.org/download.html>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/freetype/CMakeLists.txt>`__
-  Available since
   `v0.12.30 <https://github.com/ruslo/hunter/releases/tag/v0.12.30>`__
-  Added by `Denis A. Kerzhemanov <https://github.com/Dinno>`__
   (`pr-284 <https://github.com/ruslo/hunter/pull/284>`__)

.. code-block:: cmake

    hunter_add_package(freetype)
    find_package(freetype CONFIG REQUIRED)
    target_link_libraries(... freetype::freetype)
