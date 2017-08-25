.. spelling::

    iokit

.. _pkg.iokit:

    iokit
    =====
.. code:: cmake

    find_package(iokit REQUIRED)
    target_link_libraries(... iokit::iokit)

Same as

.. code:: cmake

    target_link_libraries(... "-framework IOKit")

-  https://developer.apple.com/documentation/iokit?language=objc
