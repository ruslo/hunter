.. spelling::

    Android-SDK

.. index:: android ; Android-SDK

.. _pkg.Android-SDK:

Android-SDK
===========

This module helps to create Android SDK directory:

- https://github.com/hunter-packages/android-sdk

.. code-block:: cmake

    hunter_add_package(Android-SDK)
    message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
    message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
    message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

-  `Examples <https://github.com/forexample/android-cmake>`__
