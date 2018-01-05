.. spelling::

    rabit

.. index:: messaging ; rabit

.. _pkg.rabit:

rabit
==========

-  `Official <https://github.com/dmlc/rabit>`__
-  `Hunterized <https://github.com/hunter-packages/rabit/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/rabit/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(rabit)
    find_package(rabit CONFIG REQUIRED)
    target_link_libraries(... rabit::rabit)
