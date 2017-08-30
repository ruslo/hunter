.. spelling::

    GSL

.. index:: math ; GSL

.. _pkg.GSL:

GSL
===

-  `GitHub mirror <https://github.com/hunter-packages/gsl>`__
-  `Hunterized <https://github.com/hunter-packages/gsl>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/GSL/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(GSL)
    find_package(GSL CONFIG REQUIRED)
    target_link_libraries(... GSL::gsl)
