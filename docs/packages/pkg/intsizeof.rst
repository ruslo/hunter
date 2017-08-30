.. spelling::

    intsizeof

.. index:: unsorted ; intsizeof

.. _pkg.intsizeof:

intsizeof
=========

-  `Official <https://github.com/ruslo/intsizeof>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/intsizeof/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(intsizeof)
    find_package(intsizeof CONFIG REQUIRED)
    target_link_libraries(... PUBLIC intsizeof::intsizeof)
