.. spelling::

    fft

.. index:: math ; fft2d

.. _pkg.fft2d:

fft2d
=====

-  `Official <http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html>`__
-  `Hunterized <https://github.com/hunter-packages/fft2d>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/fft2d/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1161 <https://github.com/ruslo/hunter/pull/1161>`__)

.. code-block:: cmake

    hunter_add_package(fft2d)
    find_package(fft2d CONFIG REQUIRED)
    target_link_libraries(fft2d fft2d::fft2d)
