.. spelling::

    coreaudio

.. index:: system_library_finder ; coreaudio

.. _pkg.coreaudio:

coreaudio
=========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(coreaudio REQUIRED)
    target_link_libraries(... coreaudio::coreaudio)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreAudio")

-  https://developer.apple.com/documentation/coreaudio?language=objc
