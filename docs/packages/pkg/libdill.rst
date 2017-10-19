.. spelling::

    libdill

.. index:: concurrency ; libdill

.. _pkg.libdill:

libdill
=======

-  `Official <https://github.com/sustrik/libdill>`__
-  `Hunterized <https://github.com/hunter-packages/libdill>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/libdill/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1069 <https://github.com/ruslo/hunter/pull/1069>`__)

.. code-block:: cmake

    hunter_add_package(libdill)
    find_package(libdill CONFIG REQUIRED)
    target_link_libraries(libdill libdill::dill)
