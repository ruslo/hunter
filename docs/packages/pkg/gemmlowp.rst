.. spelling::

    gemmlowp

.. index:: math ; gemmlowp

.. _pkg.gemmlowp:

gemmlowp
========

-  `Official <https://github.com/google/gemmlowp>`__
-  `Hunterized <https://github.com/hunter-packages/gemmlowp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gemmlowp/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1149 <https://github.com/ruslo/hunter/pull/1149>`__)

.. code-block:: cmake

    hunter_add_package(gemmlowp)
    find_package(gemmlowp CONFIG REQUIRED)
    target_link_libraries(gemmlowp gemmlowp::gemmlowp)
