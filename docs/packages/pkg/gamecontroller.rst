.. spelling::

    gamecontroller

.. index:: system_library_finder ; gamecontroller

.. _pkg.gamecontroller:

gamecontroller
==============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(gamecontroller REQUIRED)
    target_link_libraries(... gamecontroller::gamecontroller)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework GameController")

-  https://developer.apple.com/documentation/gamecontroller?language=objc
