.. spelling::

    double
    conversion

.. index:: math ; double-conversion

.. _pkg.double-conversion:

double-conversion
=================

-  `Official <https://github.com/google/double-conversion>`__
-  `Hunterized <https://github.com/hunter-packages/double-conversion>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/double-conversion/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1017 <https://github.com/ruslo/hunter/pull/1017>`__)

.. code-block:: cmake

    hunter_add_package(double-conversion)
    find_package(double-conversion CONFIG REQUIRED)
    target_link_libraries(... double-conversion::double-conversion)
