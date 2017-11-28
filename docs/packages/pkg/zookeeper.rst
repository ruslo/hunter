.. spelling::

    zookeeper

.. index:: unsorted ; zookeeper

.. _pkg.zookeeper:

zookeeper
=========

-  `Official <https://zookeeper.apache.org/>`__
-  `Hunterized <https://github.com/hunter-packages/zookeeper>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/zookeeper/CMakeLists.txt>`__
-  Available since `v0.18.5 <https://github.com/ruslo/hunter/releases/tag/v0.18.5>`__
-  Added by `<https://github.com/wheybags>`__ (`pr-639 <https://github.com/ruslo/hunter/pull/639>`__)

.. code-block:: cmake

    hunter_add_package(zookeeper)
    find_package(zookeeper CONFIG REQUIRED)
    #...
    target_link_libraries(foo zookeeper::zookeeper_mt)
    #target_link_libraries(foo zookeeper::zookeeper_st) # if you want the single-threaded lib instead
