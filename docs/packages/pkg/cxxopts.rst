.. spelling::

    cxxopts

.. index:: commandline tools ; cxxopts

.. _pkg.cxxopts:

cxxopts
=======

-  `Official <https://github.com/jarro2783/cxxopts>`__
-  `Hunterized <https://github.com/hunter-packages/cxxopts>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/cxxopts/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(cxxopts)
    find_package(cxxopts CONFIG REQUIRED)

    target_link_libraries(... PUBLIC cxxopts::cxxopts)
