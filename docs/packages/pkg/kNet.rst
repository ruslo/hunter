.. spelling::

    kNet

.. index:: networking ; kNet

.. _pkg.kNet:

kNet
====

-  `Official GitHub <https://github.com/juj/kNet>`__
-  `Hunterized <https://github.com/hunter-packages/kNet>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/kNet/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(kNet)
    find_package(kNet CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC kNet::kNet)
