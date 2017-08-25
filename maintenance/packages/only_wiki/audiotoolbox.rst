.. spelling::

    audiotoolbox

.. _pkg.audiotoolbox:

    audiotoolbox
    ============
.. code:: cmake

    find_package(audiotoolbox REQUIRED)
    target_link_libraries(... audiotoolbox::audiotoolbox)

Same as

.. code:: cmake

    target_link_libraries(... "-framework AudioToolbox")

-  https://developer.apple.com/documentation/audiotoolbox?language=objc
