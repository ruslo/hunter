.. spelling::

    crc32c
    crc

.. index:: crypto ; crc32c

.. _pkg.crc32c:

crc32c
======

-  `Official <https://github.com/google/crc32c>`__
-  `Hunterized <https://github.com/hunter-packages/crc32c>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/crc32c/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1243 <https://github.com/ruslo/hunter/pull/1243>`__)

.. code-block:: cmake

    hunter_add_package(crc32c)
    find_package(crc32c CONFIG REQUIRED)
    target_link_libraries(... crc32c::crc32c)
