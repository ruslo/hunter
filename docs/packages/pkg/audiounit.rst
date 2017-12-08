.. spelling::

    audiounit

.. index:: system_library_finder ; audiounit

.. _pkg.audiounit:

audiounit
=========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(audiounit REQUIRED)
    target_link_libraries(... audiounit::audiounit)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AudioUnit")

-  https://developer.apple.com/documentation/audiounit?language=objc
