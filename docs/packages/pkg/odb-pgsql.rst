.. spelling::

    odb
    pgsql

.. index:: database ; odb-pgsql

.. _pkg.odb-pgsql:

odb-pgsql
=========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.37-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.37
  :alt: Hunter v0.12.37

-  `Official <http://www.codesynthesis.com/products/odb/download.xhtml>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/odb-pgsql/CMakeLists.txt>`__
- Available since |hunter|
-  Added by `Alexandre Pretyman <https://github.com/pretyman>`__
   (`pr-307 <https://github.com/ruslo/hunter/pull/307>`__)

.. code-block:: cmake

    hunter_add_package(odb-pgsql)
    find_package(odb COMPONENTS pgsql)

    target_link_libraries(... odb::pgsql)
