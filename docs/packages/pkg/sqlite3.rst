.. spelling::

    sqlite3

.. index:: database ; sqlite3

.. _pkg.sqlite3:

sqlite3
=======

-  https://www.sqlite.org
-  `Hunterized <https://github.com/hunter-packages/sqlite3>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/sqlite3/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(sqlite3)
    find_package(sqlite3 REQUIRED)
    target_link_libraries(boo PUBLIC sqlite3::sqlite3)
