.. spelling::

    quartzcore

.. _pkg.quartzcore:

quartzcore
==========

.. code-block::cmake

    find_package(quartzcore REQUIRED)
    target_link_libraries(... quartzcore::quartzcore)

Same as

.. code-block::cmake

    target_link_libraries(... "-framework QuartzCore")

-  https://developer.apple.com/documentation/quartzcore?language=objc
