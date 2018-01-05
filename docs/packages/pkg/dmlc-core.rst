.. spelling::

    dmlc-core

.. index:: unsorted ; dmlc-core

.. _pkg.dmlc-core:

dmlc-core
===========


-  `Official <https://github.com/dmlc/dmlc-core>`__
-  `Hunterized <https://github.com/hunter-packages/dmlc-core>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/dmlc-core/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(dmlc-core)
    find_package(dmlc CONFIG REQUIRED)
    target_link_libraries(foo dmlc::dmlc)
