.. spelling::

    qt.qml.manager

.. _pkg.qt.qml.manager:

qt.qml.manager
==============

-  `Official <https://github.com/hunter-packages/QtQmlManager>`__
-  `Example <https://github.com/hunter-packages/QtQmlManager/blob/master/example/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(QtQmlManager)
    list(APPEND CMAKE_MODULE_PATH "${QTQMLMANAGER_ROOT}/cmake")
    include(QtCopyQmlTo)

    QtCopyQmlTo(${qml_dir})
