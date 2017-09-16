.. spelling::

    ARM_NEON_2_x86_SSE

.. index:: cpu ; ARM_NEON_2_x86_SSE

.. _pkg.ARM_NEON_2_x86_SSE:

ARM_NEON_2_x86_SSE
==================

-  `Official <https://github.com/intel/ARM_NEON_2_x86_SSE>`__
-  `Hunterized <https://github.com/hunter-packages/ARM_NEON_2_x86_SSE>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ARM_NEON_2_x86_SSE/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(ARM_NEON_2_x86_SSE)
    find_package(ARM_NEON_2_x86_SSE CONFIG REQUIRED)
    target_link_libraries(... ARM_NEON_2_x86_SSE::ARM_NEON_2_x86_SSE)
