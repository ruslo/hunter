.. spelling::

    assetslibrary

.. _pkg.assetslibrary:

    assetslibrary
    =============
.. code-block::cmake

    find_package(assetslibrary REQUIRED)
    target_link_libraries(... assetslibrary::assetslibrary)

Same as

.. code-block::cmake

    target_link_libraries(... "-framework AssetsLibrary")

-  https://developer.apple.com/documentation/assetslibrary?language=objc
