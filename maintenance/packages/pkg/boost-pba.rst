.. spelling::

    boost-pba

.. _pkg.boost-pba:

    boost-pba
    =========
boost-pba
~~~~~~~~~

-  `Hunterized <https://github.com/hunter-packages/boost-pba>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/boost-pba/CMakeLists.txt>`__

.. code:: cmake

    hunter_add_package(boost-pba) 
    find_package(boost-pba CONFIG REQUIRED)
    target_link_libraries(... boost-pba::boost-pba)
