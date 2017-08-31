.. spelling::

    half

.. index:: math ; half

.. _pkg.half:

half
====

-  `Official <http://half.sourceforge.net>`__
-  `Hunterized <https://github.com/headupinclouds/half/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/half/CMakeLists.txt>`__
-  Available since
   `v0.12.31 <https://github.com/ruslo/hunter/releases/tag/v0.12.31>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__
   (`pr-286 <https://github.com/ruslo/hunter/pull/286>`__)

.. code-block:: cmake

    hunter_add_package(half)
    find_package(half CONFIG REQUIRED)
    target_link_libraries(... half::half)
