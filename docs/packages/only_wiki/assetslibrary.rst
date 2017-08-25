.. spelling::

    assetslibrary

.. _pkg.assetslibrary:

assetslibrary
=============

File only available in wiki.
Please merge with hunter-package entry

.. code-block:: cmake

    find_package(assetslibrary REQUIRED)
    target_link_libraries(... assetslibrary::assetslibrary)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework AssetsLibrary")

-  https://developer.apple.com/documentation/assetslibrary?language=objc
