.. spelling::

    forcefeedback

.. index:: system_library_finder ; forcefeedback

.. _pkg.forcefeedback:

forcefeedback
=============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(forcefeedback REQUIRED)
    target_link_libraries(... forcefeedback::forcefeedback)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework ForceFeedback")

-  https://developer.apple.com/documentation/forcefeedback?language=objc
