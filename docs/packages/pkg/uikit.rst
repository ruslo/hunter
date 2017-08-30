.. spelling::

    uikit

.. index:: system_library_finder ; uikit

.. _pkg.uikit:

uikit
=====

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(uikit REQUIRED)
    target_link_libraries(... uikit::uikit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework UIKit")

-  https://developer.apple.com/documentation/uikit?language=objc
