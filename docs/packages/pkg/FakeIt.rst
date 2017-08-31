.. spelling::

    FakeIt

.. index:: testing ; FakeIt

.. _pkg.FakeIt:

FakeIt
======

-  `Official <https://github.com/eranpeer/FakeIt>`__
-  `Hunterized <https://github.com/hunter-packages/FakeIt>`__
-  Available since
   `v0.18.24 <https://github.com/ruslo/hunter/releases/tag/v0.18.24>`__

.. code-block:: cmake

    hunter_add_package(FakeIt)
    find_package(FakeIt CONFIG REQUIRED)
    target_link_libraries(... FakeIt::FakeIt)
