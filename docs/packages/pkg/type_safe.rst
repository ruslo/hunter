.. spelling::

    type_safe

.. index:: unsorted ; type_safe

.. _pkg.type_safe:

type_safe
============

-  `Official <https://github.com/foonathan/type_safe>`__
-  `Hunterized <https://github.com/dvirtz/type_safe>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/type_safe/CMakeLists.txt>`__
-  Added by `dvirtz <https://github.com/dvirtz>`__ (`pr-1143 <https://github.com/ruslo/hunter/pull/1143>`__)

.. code-block:: cmake

    hunter_add_package(type_safe)
    find_package(type_safe CONFIG REQUIRED)
    target_link_libraries(type_safe_example type_safe)
