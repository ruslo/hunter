.. spelling::

    coremedia

.. index:: system_library_finder ; coremedia

.. _pkg.coremedia:

coremedia
=========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(coremedia REQUIRED)
    target_link_libraries(... coremedia::coremedia)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreMedia")

-  https://developer.apple.com/documentation/coremedia?language=objc
