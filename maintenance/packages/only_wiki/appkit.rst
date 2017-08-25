.. spelling::

    appkit

.. _pkg.appkit:

    appkit
    ======
.. code:: cmake

    find_package(appkit REQUIRED)
    target_link_libraries(... appkit::appkit)

Same as

.. code:: cmake

    target_link_libraries(... "-framework AppKit")

-  https://developer.apple.com/documentation/appkit?language=objc
