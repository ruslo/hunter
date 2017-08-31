.. spelling::

    Android-Apk
    Apk

.. index:: android ; Android-Apk

.. _pkg.Android-Apk:

Android-Apk
===========

-  `Official <https://github.com/Uroc327Mirrors/pixellight/tree/master/cmake/Android>`__
-  `Hunterized <https://github.com/hunter-packages/android-apk>`__
-  `Usage examples <https://github.com/forexample/android-cmake>`__

.. code-block:: cmake

    hunter_add_package(Android-Apk)
    list(APPEND CMAKE_MODULE_PATH "${ANDROID-APK_ROOT}")
    include(AndroidApk)
    add_library(simple ...)
    android_create_apk(NAME simple DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/apk")
