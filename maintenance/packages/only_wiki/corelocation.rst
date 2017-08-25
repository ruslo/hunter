.. spelling::

    corelocation

.. _pkg.corelocation:

    corelocation
    ============
.. code:: cmake

    find_package(corelocation REQUIRED)
    target_link_libraries(... corelocation::corelocation)

Same as

.. code:: cmake

    target_link_libraries(... "-framework CoreLocation")

-  https://developer.apple.com/documentation/corelocation?language=objc
