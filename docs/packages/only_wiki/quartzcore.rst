.. spelling::

    quartzcore

.. _pkg.quartzcore:

quartzcore
==========

.. note::

    This is a helper package. There is no corresponding package in hunter to be included by ``hunter_add_package(...)``

.. code-block:: cmake

    find_package(quartzcore REQUIRED)
    target_link_libraries(... quartzcore::quartzcore)

Same as

.. code-block:: cmake

    target_link_libraries(... "-framework QuartzCore")

-  https://developer.apple.com/documentation/quartzcore?language=objc
