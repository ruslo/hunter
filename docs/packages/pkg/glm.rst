.. spelling::

    glm

.. index:: math ; glm

.. _pkg.glm:

glm
===

-  `Official <https://github.com/g-truc/glm>`__
-  `Hunterized <https://github.com/hunter-packages/glm>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/glm/core_func_common.cpp>`__

.. code-block:: cmake

    hunter_add_package(glm)
    find_package(glm REQUIRED)
    target_link_libraries(... PRIVATE glm)
