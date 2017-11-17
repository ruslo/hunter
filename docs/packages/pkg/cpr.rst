.. spelling::

    cpr

.. index:: networking ; cpr

.. _pkg.cpr:

cpr
===

-  `Official <https://github.com/whoshuu/cpr>`__
-  `Hunterized <https://github.com/hunter-packages/cpr>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/cpr/CMakeLists.txt>`__
-  Added by `dvirtz <https://github.com/dvirtz>`__ (`pr-1212 <https://github.com/ruslo/hunter/pull/1212>`__)

.. code-block:: cmake

    hunter_add_package(cpr)
    find_package(cpr CONFIG REQUIRED)

    add_executable(cpr_example ...)
    target_link_libraries(cpr_example cpr::cpr)
