.. spelling::

    spdlog

.. index:: logging ; spdlog

.. _pkg.spdlog:

spdlog
======

-  `Official <https://github.com/gabime/spdlog>`__
-  `Hunterized <https://github.com/hunter-packages/spdlog>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/spdlog/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(spdlog)

    find_package(spdlog CONFIG REQUIRED)

    target_link_libraries(... spdlog::spdlog)
