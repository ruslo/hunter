.. spelling::

    lzma

.. index:: compression ; lzma

.. _pkg.lzma:

lzma
====

-  `Official <http://tukaani.org/xz/>`__
-  `Hunterized <https://github.com/hunter-packages/lzma>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/lzma/CMakeLists.txt>`__
-  Available since
   `v0.18.17 <https://github.com/ruslo/hunter/releases/tag/v0.18.17>`__

.. code-block:: cmake

    hunter_add_package(lzma)
    find_package(lzma CONFIG REQUIRED)
    target_link_libraries(... lzma::lzma)
