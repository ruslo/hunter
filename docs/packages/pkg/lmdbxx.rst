.. spelling::

    lmdbxx

.. index:: database ; lmdbxx

.. _pkg.lmdbxx:

lmdbxx
======

-  `Official <https://github.com/bendiken/lmdbxx>`__
-  `Hunterized <https://github.com/hunter-packages/lmdbxx>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/lmdbxx/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1250 <https://github.com/ruslo/hunter/pull/1250>`__)

.. code-block:: cmake

    hunter_add_package(lmdbxx)
    find_package(lmdbxx CONFIG REQUIRED)
    target_link_libraries(... lmdbxx::lmdbxx)
