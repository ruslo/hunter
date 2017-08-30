.. spelling::

    BZip

.. index:: compression ; BZip2

.. _pkg.BZip2:

BZip2
=====

-  `Official <http://bzip.org>`__
-  `Hunterized <https://github.com/hunter-packages/bzip2>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/BZip2/CMakeLists.txt>`__
-  Available since
   `v0.9.9 <https://github.com/ruslo/hunter/releases/tag/v0.9.9>`__

.. code-block:: cmake

    hunter_add_package(BZip2)

    find_package(BZip2 CONFIG REQUIRED)
    target_link_libraries(... BZip2::bz2)
