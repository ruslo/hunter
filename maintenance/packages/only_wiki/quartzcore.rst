.. spelling::

    quartzcore

.. _pkg.quartzcore:

    quartzcore
    ==========
.. code:: cmake

    find_package(quartzcore REQUIRED)
    target_link_libraries(... quartzcore::quartzcore)

Same as

.. code:: cmake

    target_link_libraries(... "-framework QuartzCore")

-  https://developer.apple.com/documentation/quartzcore?language=objc
