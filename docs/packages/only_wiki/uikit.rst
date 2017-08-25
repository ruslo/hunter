.. spelling::

    uikit

.. _pkg.uikit:

uikit
=====

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(uikit REQUIRED)
    target_link_libraries(... uikit::uikit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework UIKit")

-  https://developer.apple.com/documentation/uikit?language=objc
