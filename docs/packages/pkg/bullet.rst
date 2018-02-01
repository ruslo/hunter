.. spelling::

    bullet

.. index:: physics ; bullet

.. _pkg.bullet:

bullet
======

-  http://bulletphysics.org/wordpress/
-  `Official GitHub <https://github.com/bulletphysics/bullet3>`__
-  `Hunterized <https://github.com/hunter-packages/bullet3>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/bullet/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(bullet)
    find_package(bullet CONFIG REQUIRED)
    target_link_libraries(
        boo
        PUBLIC
        bullet::Bullet3Common
        bullet::BulletCollision
        bullet::BulletDynamics
        bullet::BulletInverseDynamics
        bullet::BulletSoftBody
        bullet::LinearMath
    )
