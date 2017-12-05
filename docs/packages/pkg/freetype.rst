.. spelling::

    freetype

.. index:: graphics ; freetype

.. _pkg.freetype:

freetype
========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.30-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.30
  :alt: Hunter v0.12.30

-  `Official <http://www.freetype.org/download.html>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/freetype/CMakeLists.txt>`__
- Available since |hunter|
-  Added by `Denis A. Kerzhemanov <https://github.com/Dinno>`__
   (`pr-284 <https://github.com/ruslo/hunter/pull/284>`__)

.. code-block:: cmake

    hunter_add_package(freetype)
    find_package(freetype CONFIG REQUIRED)
    target_link_libraries(... freetype::freetype)
