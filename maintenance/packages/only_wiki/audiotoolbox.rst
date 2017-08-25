.. spelling::

    audiotoolbox

.. _pkg.audiotoolbox:

audiotoolbox
============

.. code-block:: cmake

    find_package(audiotoolbox REQUIRED)
    target_link_libraries(... audiotoolbox::audiotoolbox)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AudioToolbox")

-  https://developer.apple.com/documentation/audiotoolbox?language=objc
