.. spelling::

    dynalo

.. index:: os ; dynalo

.. _pkg.dynalo:

dynalo
===

-  `Official <https://github.com/maddouri/dynalo>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/dynalo/CMakeLists.txt>`__
-  Added by `Yassine Maddouri <https://github.com/maddouri>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    hunter_add_package(dynalo)
    find_package(dynalo CONFIG REQUIRED)
    target_link_libraries(... dynalo)
