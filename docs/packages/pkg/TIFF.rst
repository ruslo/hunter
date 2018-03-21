.. spelling::

    TIFF

.. index:: media ; TIFF

.. _pkg.TIFF:

TIFF
====

-  `Official <http://www.remotesensing.org/libtiff/>`__
-  `Hunterized <https://github.com/hunter-packages/tiff>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/TIFF/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(TIFF)
    find_package(TIFF CONFIG REQUIRED)
    target_link_libraries(... TIFF::libtiff)
