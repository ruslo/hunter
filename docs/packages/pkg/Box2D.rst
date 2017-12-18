.. spelling::

    Box2D

.. index:: physics ; Box2D

.. _pkg.Box2D:

Box2D
=====

-  http://box2d.org
-  `Official GitHub <https://github.com/erincatto/Box2D>`__
-  `Hunterized <https://github.com/hunter-packages/Box2D>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Box2D/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(Box2D)
    find_package(Box2D CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC Box2D::Box2D)
