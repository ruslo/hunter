.. spelling::

    Beast

.. _pkg.Beast:

    Beast
    =====
Beast
'''''

-  `Official <https://github.com/vinniefalco/Beast>`__
-  `Hunterized <https://github.com/hunter-packages/Beast>`__
-  Available since
   `0.19.9 <https://github.com/ruslo/hunter/releases/tag/v0.19.9>`__

.. code:: cmake

    hunter_add_package(Beast)
    find_package(Beast CONFIG REQUIRED)
    target_link_libraries(... Beast::Beast)
