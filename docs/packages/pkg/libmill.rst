.. spelling::

    libmill

.. index:: concurrency ; libmill

.. _pkg.libmill:

libmill
=======

-  `Official <https://github.com/sustrik/libmill>`__
-  `Hunterized <https://github.com/hunter-packages/libmill>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/libmill/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1063 <https://github.com/ruslo/hunter/pull/1063>`__)

.. code-block:: cmake

    hunter_add_package(libmill)
    find_package(libmill CONFIG REQUIRED)
    # `mill_s` is static library, `mill` is shared library
    target_link_libraries(libmill libmill::mill_s)
