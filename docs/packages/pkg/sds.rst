.. spelling::

    sds

.. index:: containers ; sds

.. _pkg.sds:

sds
===

-  `Official <https://github.com/antirez/sds>`__
-  `Hunterized <https://github.com/hunter-packages/sds>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/sds/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1254 <https://github.com/ruslo/hunter/pull/1254>`__)

.. code-block:: cmake

    hunter_add_package(sds)
    find_package(sds CONFIG REQUIRED)
    target_link_libraries(... sds::sds)
