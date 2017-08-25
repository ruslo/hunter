.. spelling::

    uikit

.. _pkg.uikit:

    uikit
    =====
.. code:: cmake

    find_package(uikit REQUIRED)
    target_link_libraries(... uikit::uikit)

Same as

.. code:: cmake

    target_link_libraries(... "-framework UIKit")

-  https://developer.apple.com/documentation/uikit?language=objc
