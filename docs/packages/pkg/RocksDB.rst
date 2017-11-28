.. spelling::

    RocksDB
    Paweł
    Bylica

.. index:: database ; RocksDB

.. _pkg.RocksDB:

RocksDB
=======

-  `Webpage <http://rocksdb.org>`__
-  `Source code <https://github.com/facebook/rocksdb>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/RocksDB/CMakeLists.txt>`__
-  Added by Paweł Bylica `chfast <https://github.com/chfast>`__ (`pr-991 <https://github.com/ruslo/hunter/pull/991>`__)

.. code-block:: cmake

    hunter_add_package(RocksDB)
    find_package(RocksDB CONFIG REQUIRED)
    target_link_libraries(target RocksDB::rocksdb)
