.. spelling::

    lmdb

.. index:: database ; lmdb

.. _pkg.lmdb:

lmdb
====

-  `Official <http://www.openldap.org/software/repo.html>`__
-  `Hunterized <https://github.com/hunter-packages/lmdb>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/lmdb/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1172 <https://github.com/ruslo/hunter/pull/1172>`__)

.. code-block:: cmake

    hunter_add_package(lmdb)
    find_package(liblmdb CONFIG REQUIRED)
    target_link_libraries(lmdb liblmdb::lmdb)
