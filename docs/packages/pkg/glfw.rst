.. spelling::

    glfw

.. index:: unsorted ; glfw

.. _pkg.glfw:

glfw
====

-  `Official <http://www.glfw.org/>`__
-  `Official GitHub <https://github.com/glfw/glfw>`__
-  `Hunterized <https://github.com/hunter-packages/glfw>`__
-  `Example <https://github.com/ruslo/hunter/tree/master/examples/glfw>`__

.. code-block:: cmake

    hunter_add_package(glfw)
    find_package(glfw3 REQUIRED)
    target_link_libraries(... glfw)
