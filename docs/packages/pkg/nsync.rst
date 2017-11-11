.. spelling::

    nsync

.. index:: unsorted ; nsync

.. _pkg.nsync:

nsync
=====

-  `Official <https://github.com/google/nsync>`__
-  `Hunterized <https://github.com/hunter-packages/nsync>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/nsync/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1169 <https://github.com/ruslo/hunter/pull/1169>`__)

.. code-block:: cmake

    hunter_add_package(nsync)
    find_package(nsync CONFIG REQUIRED)
    target_link_libraries(foo nsync::nsync)
