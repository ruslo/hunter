.. spelling::

    xgboost

.. index:: computer-vision ; xgboost

.. _pkg.xgboost:

xgboost
=======

-  `Official GitHub <https://github.com/dmlc/xgboost>`__
-  `Hunterized <https://github.com/hunter-packages/xgboost>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/xgboost/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(xgboost)
    find_package(xgboost CONFIG REQUIRED)
    target_link_libraries(... xgboost::xgboost)
