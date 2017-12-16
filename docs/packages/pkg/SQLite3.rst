.. spelling::

    SQLite3

.. index:: database ; SQLite3

.. _pkg.SQLite3:

SQLite3
=======

-  https://www.sqlite.org
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/SQLite3/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(SQLite3)
    find_package(SQLite3 REQUIRED)
    target_link_libraries(boo PUBLIC SQLite3)
