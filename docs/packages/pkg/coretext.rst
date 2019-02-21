.. spelling::

    coretext

.. index:: system_library_finder ; coretext

.. _pkg.coretext:

coretext
========

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(coretext REQUIRED)
    target_link_libraries(... coretext::coretext)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework CoreText")

-  https://developer.apple.com/documentation/coretext?language=objc
