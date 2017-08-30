.. spelling::

    openddlparser

.. index:: unsorted ; openddlparser

.. _pkg.openddlparser:

openddlparser
=============

-  `Official <https://github.com/kimkulling/openddl-parser>`__
-  `Hunterized <https://github.com/hunter-packages/openddl-parser>`__

.. code-block:: cmake

    hunter_add_package(openddlparser)
    find_package(openddlparser CONFIG REQUIRED)
    target_link_libraries(... openddlparser::openddl_parser)
