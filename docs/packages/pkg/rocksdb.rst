.. spelling::

    rocksdb
    Paweł
    Bylica
    Isaac
    Hier

.. index:: database ; rocksdb

.. _pkg.rocksdb:

rocksdb
=======

-  `Webpage <http://rocksdb.org>`__
-  `Source code <https://github.com/facebook/rocksdb>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/rocksdb/CMakeLists.txt>`__
-  Started by Paweł Bylica `chfast <https://github.com/chfast>`__ (`pr-991 <https://github.com/ruslo/hunter/pull/991>`__)
-  Completed by Isaac Hier `isaachier <https://github.com/isaachier>`__ (`pr-1231 <https://github.com/ruslo/hunter/pull/1231>`__)

.. code-block:: cmake

    hunter_add_package(rocksdb)
    find_package(RocksDB CONFIG REQUIRED)
    target_link_libraries(target RocksDB::rocksdb)
