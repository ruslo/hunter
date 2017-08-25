.. spelling::

    mysql.client

.. _pkg.mysql.client:

    mysql.client
    ============
-  `Official <http://dev.mysql.com/downloads/connector/cpp/>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/MySQL-client/CMakeLists.txt>`__
-  Available since
   `v0.12.51 <https://github.com/ruslo/hunter/releases/tag/v0.12.51>`__

.. code:: cmake

    hunter_add_package(MySQL-client)
    find_package(MySQL-client REQUIRED)
    target_link_libraries(... "MySQL::libmysql")

pre Hunter v0.19.58 use the below

.. code:: cmake

    hunter_add_package(MySQL-client)
    find_package(MySQL-client REQUIRED)
    target_link_libraries(... "MySQL::client")
