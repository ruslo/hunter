.. spelling::

    globjects

.. index:: ui ; globjects

.. _pkg.globjects:

globjects
=========

-  `Official <https://github.com/cginternals/globjects>`__
-  `Hunterized <https://github.com/hunter-packages/globjects>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/globjects/CMakeLists.txt>`__
-  Added by `NeroBurner <https://github.com/NeroBurner>`__ (`pr-1075 <https://github.com/ruslo/hunter/pull/1075>`__)

.. code-block:: cmake

    hunter_add_package(globjects)
    find_package(globjects CONFIG REQUIRED)
    target_link_libraries(foo globjects::globjects)
    
    
Current globjects version 1.1.0-p0 requires version 2.1.3-p0 of glbinding (which is not the default). You will need to define a custom config for hunter in order for it to compile, see https://github.com/ruslo/hunter/wiki/example.custom.config.id
