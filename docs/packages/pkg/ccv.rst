.. spelling::

    ccv

.. index:: computer-vision ; ccv

.. _pkg.ccv:

ccv
===

-  `Official <https://github.com/liuliu/ccv>`__
-  `Hunterized <https://github.com/headupinclouds/ccv>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ccv/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(ccv)
    find_package(ccv REQUIRED CONFIG)

    target_link_libraries(... ccv::ccv)
