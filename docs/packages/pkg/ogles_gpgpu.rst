.. spelling::

    ogles
    gpgpu

.. index:: concurrency ; ogles_gpgpu,
    graphics ; ogles_gpgpu

.. _pkg.ogles_gpgpu:

ogles_gpgpu
===========

-  `GitHub Official <https://github.com/internaut/ogles_gpgpu>`__
-  `Hunterized <https://github.com/hunter-packages/ogles_gpgpu>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ogles_gpgpu/foo.cpp>`__
-  Maintainer: https://github.com/ruslo

.. code-block:: cmake

    hunter_add_package(ogles_gpgpu)
    find_package(ogles_gpgpu CONFIG REQUIRED)
    target_link_libraries(... ogles_gpgpu::ogles_gpgpu)
