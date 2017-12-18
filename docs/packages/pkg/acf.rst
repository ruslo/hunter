.. spelling::

    acf

.. index:: computer-vision ; acf

.. _pkg.acf:

acf
===

-  `Official <https://github.com/elucideye/acf>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/acf/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1176 <https://github.com/ruslo/hunter/pull/1176>`__)

.. code-block:: cmake

    hunter_add_package(acf)
    find_package(acf CONFIG REQUIRED)
    target_link_libraries(acf acf::acf)
