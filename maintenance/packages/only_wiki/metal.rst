.. spelling::

    metal

.. _pkg.metal:

    metal
    =====
.. code-block::cmake

    find_package(metal REQUIRED)
    target_link_libraries(... metal::metal)

Same as

.. code-block::cmake

    target_link_libraries(... "-framework Metal")

-  https://developer.apple.com/documentation/metal?language=objc
