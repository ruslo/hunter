.. spelling::

    android.modules

.. _pkg.android.modules:

android.modules
===============

File only available in wiki.
Please merge with hunter-package entry

Android-Modules
'''''''''''''''

-  `Official <https://github.com/taka-no-me/android-cmake>`__
-  `Hunterized <https://github.com/hunter-packages/android-cmake>`__

.. code-block:: cmake

    hunter_add_package(Android-Modules)

    list(APPEND CMAKE_MODULE_PATH "${ANDROID-MODULES_ROOT}")

    include(AndroidNdkGdb)
    include(AndroidNdkModules)
