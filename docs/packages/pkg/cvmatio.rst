.. spelling::

    cvmatio

.. index:: computer-vision ; cvmatio

.. _pkg.cvmatio:

cvmatio
=======

-  `Official <https://github.com/hbristow/cvmatio>`__
-  `Hunterized <https://github.com/hunter-packages/cvmatio>`__

.. code-block:: cmake

    hunter_add_package(cvmatio)
    find_package(cvmatio CONFIG REQUIRED)
    target_link_libraries(... cvmatio::cvmatio)
