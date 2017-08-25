.. spelling::

    coremedia

.. _pkg.coremedia:

    coremedia
    =========
.. code-block::cmake

    find_package(coremedia REQUIRED)
    target_link_libraries(... coremedia::coremedia)

Same as

.. code-block::cmake

    target_link_libraries(... "-framework CoreMedia")

-  https://developer.apple.com/documentation/coremedia?language=objc
