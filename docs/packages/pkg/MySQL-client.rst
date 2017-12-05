.. spelling::

    MySQL-client

.. index:: database ; MySQL-client

.. _pkg.MySQL-client:

MySQL-client
============

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.51-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.51
  :alt: Hunter v0.12.51

-  `Official <http://dev.mysql.com/downloads/connector/cpp/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/MySQL-client/CMakeLists.txt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(MySQL-client)
    find_package(MySQL-client REQUIRED)
    target_link_libraries(... "MySQL::libmysql")

before Hunter `v0.19.58 <https://github.com/ruslo/hunter/releases/tag/v0.19.58>`__

.. code-block:: cmake

    hunter_add_package(MySQL-client)
    find_package(MySQL-client REQUIRED)
    target_link_libraries(... "MySQL::client")
