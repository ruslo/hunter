.. spelling::

    glew

.. index:: graphics ; glew

.. _pkg.glew:

glew
====

-  http://glew.sourceforge.net
-  `Official GitHub <https://github.com/nigels-com/glew>`__
-  `Hunterized <https://github.com/hunter-packages/glew>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/glew/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(glew)
    find_package(glew CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC glew::glew)
