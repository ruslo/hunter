.. spelling::

    hunter_box_1

.. index:: unsorted ; hunter_box_1

.. _pkg.hunter_box_1:

hunter_box_1
===

-  `Official <https://github.com/hunterbox/hunter_box_1>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/hunter_box_1/CMakeLists.txt>`__
-  Added by `hunterbox <https://github.com/hunterbox>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

.. code-block:: cmake

    hunter_add_package(hunter_box_1)
    find_package(hunter_box_1 CONFIG REQUIRED)
    target_link_libraries(hunter_box_1 hunter_box_1::hunter_box_1)
