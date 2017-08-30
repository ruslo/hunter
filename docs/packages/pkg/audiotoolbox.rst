.. spelling::

    audiotoolbox

.. index:: system_library_finder ; audiotoolbox

.. _pkg.audiotoolbox:

audiotoolbox
============

.. note::

    This is a helper package. There is no corresponding package in Hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(audiotoolbox REQUIRED)
    target_link_libraries(... audiotoolbox::audiotoolbox)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AudioToolbox")

-  https://developer.apple.com/documentation/audiotoolbox?language=objc
