.. spelling::

    leveldb

.. index:: crypto ; leveldb

.. _pkg.leveldb:

leveldb
=======

-  `Official <https://github.com/google/leveldb>`__
-  `Hunterized <https://github.com/hunter-packages/leveldb>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/leveldb/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1246 <https://github.com/ruslo/hunter/pull/1246>`__)

.. code-block:: cmake

    hunter_add_package(leveldb)
    find_package(leveldb CONFIG REQUIRED)
    target_link_libraries(... leveldb::leveldb)
