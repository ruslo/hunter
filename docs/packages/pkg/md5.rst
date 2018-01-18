.. spelling::

    md

.. index:: unsorted ; md5

.. _pkg.md5:

md5
===

-  `Hunterized <https://github.com/hunter-packages/md5>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/md5/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(md5)
    find_package(md5 CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC md5::md5)
