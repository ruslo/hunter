.. spelling::

    glbinding

.. index:: ui ; glbinding

.. _pkg.glbinding:

glbinding
=========

-  `Official <https://github.com/cginternals/glbinding>`__
-  `Hunterized <https://github.com/hunter-packages/glbinding>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/glbinding/CMakeLists.txt>`__
-  Added by `NeroBurner <https://github.com/NeroBurner>`__ (`pr-1073 <https://github.com/ruslo/hunter/pull/1073>`__)

.. code-block:: cmake

    hunter_add_package(glbinding)
    find_package(glbinding CONFIG REQUIRED)
    target_link_libraries(glbinding glbinding::glbinding)
