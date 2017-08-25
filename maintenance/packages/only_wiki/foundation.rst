.. spelling::

    foundation

.. _pkg.foundation:

    foundation
    ==========
.. code:: cmake

    find_package(foundation REQUIRED)
    target_link_libraries(... foundation::foundation)

Same as

.. code:: cmake

    target_link_libraries(... "-framework Foundation")

-  https://developer.apple.com/documentation/foundation?language=objc
