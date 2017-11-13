.. spelling::

    LibCDS

.. index:: concurrency ; LibCDS

.. _pkg.LibCDS:

LibCDS
======

-  `Official <https://github.com/LibCDS/LibCDS>`__
-  `Hunterized <https://github.com/hunter-packages/LibCDS>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/LibCDS/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1194 <https://github.com/ruslo/hunter/pull/1194>`__)

.. code-block:: cmake

    hunter_add_package(LibCDS)
    find_package(LibCDS CONFIG REQUIRED)
    target_link_libraries(... LibCDS::cds)  # Use cds-s for static library
