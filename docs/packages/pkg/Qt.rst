.. spelling::

    Qt
    GStreamer

.. index:: ui ; Qt

.. _pkg.Qt:

Qt
==

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.0-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.0
  :alt: Hunter v0.12.0

-  `Official <http://qt.io>`__
-  `Source archives <http://download.qt.io/archive/qt/>`__
-  `Example <https://github.com/ruslo/hunter/tree/master/examples/qt-widgets/CMakeLists.txt>`__
-  `iOS examples <https://github.com/forexample/qt-ios-examples>`__
-  `Android
   example <https://github.com/forexample/android-cmake/tree/master/05-qt-hellogl2>`__
- Available since |hunter|

Usage
-----

Qt is split into
`components <https://github.com/ruslo/hunter/tree/develop/cmake/projects/Qt>`__.
Each component installs its corresponding ``Qt5*Config.cmake`` and
libraries.

Examples:

.. code-block:: cmake

    hunter_add_package(Qt)
    # same as: hunter_add_package(Qt COMPONENTS qtbase)

    find_package(Qt5Concurrent REQUIRED)
    find_package(Qt5Core REQUIRED)
    find_package(Qt5Gui REQUIRED)
    find_package(Qt5Network REQUIRED)
    find_package(Qt5OpenGL REQUIRED)
    find_package(Qt5OpenGLExtensions REQUIRED)
    find_package(Qt5PrintSupport REQUIRED)
    find_package(Qt5Sql REQUIRED)
    find_package(Qt5Test REQUIRED)
    find_package(Qt5Widgets REQUIRED)
    find_package(Qt5Xml REQUIRED)
    find_package(Qt5DBus REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtsvg)
    find_package(Qt5Svg REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtxmlpatterns)
    find_package(Qt5XmlPatterns REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtlocation)
    find_package(Qt5Positioning REQUIRED)
    find_package(Qt5Location REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtdeclarative)
    find_package(Qt5Qml REQUIRED)
    find_package(Qt5Quick REQUIRED)
    find_package(Qt5QuickTest REQUIRED)
    find_package(Qt5QuickWidgets REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtmultimedia)
    find_package(Qt5Multimedia REQUIRED)
    find_package(Qt5MultimediaWidgets REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtsensors)
    find_package(Qt5Sensors REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtwebsockets)
    find_package(Qt5WebSockets REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtwebchannel)
    find_package(Qt5WebChannel REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qttools)
    find_package(Qt5Designer REQUIRED)
    find_package(Qt5Help REQUIRED)
    find_package(Qt5LinguistTools REQUIRED)
    find_package(Qt5UiPlugin REQUIRED)
    find_package(Qt5UiTools REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtscript)
    find_package(Qt5Script REQUIRED)
    find_package(Qt5ScriptTools REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtquick1)
    find_package(Qt5Declarative REQUIRED)

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtimageformats)
    find_package(Qt5Gui) # load plugins
    # targets available:
    #  * Qt5::QDDSPlugin
    #  * Qt5::QICNSPlugin
    #  * Qt5::QJp2Plugin
    #  * Qt5::QMngPlugin
    #  * Qt5::QTgaPlugin
    #  * Qt5::QTiffPlugin
    #  * Qt5::QWbmpPlugin
    #  * Qt5::QWebpPlugin

.. code-block:: cmake

    hunter_add_package(Qt COMPONENTS qtquickcontrols)
    # no *.cmake modules installed

Customization
-------------

* ``QT_WITH_GSTREAMER``

  * Build with :ref:`pkg.gstreamer`
  * You will need this when building Qt application with camera support on Linux
  * Adds ``-gstreamer 1.0``
  * Only configuration with shared libraries tested. Also you have to set
    runtime paths with ``LD_LIBRARY_PATH``/``GST_PLUGIN_PATH``, see
    `example <https://github.com/ruslo/hunter/blob/master/examples/qt-camera/CMakeLists.txt>`__.
  * To test GStreamer camera you can run ``gst-launch -v -m camerabin``

* ``QT_OPENGL_DESKTOP``

  * Use OpenGL installed on Windows
  * Visual Studio
  * Adds ``-opengl desktop``
  * `Qt Configure Options <https://doc.qt.io/qt-5/configure-options.html>`__

Pitfalls
--------

-  Conflicts with system Qt: `bug with
   workaround <https://github.com/ruslo/hunter/issues/224#issuecomment-137101944>`__

-  iOS (Qt < 5.9): you must use ``qtmn`` instead of ``main``:

.. code-block:: cpp

    #include <QtGlobal> // Q_OS_IOS

    #if defined(Q_OS_IOS)
    extern "C" int qtmn(int argc, char** argv) {
    #else
    int main(int argc, char **argv) {
    #endif

you will see next error without this fix applied:

.. code-block:: none

    Error: You are creating QApplication before calling UIApplicationMain.
    If you are writing a native iOS application, and only want to use Qt for
    parts of the application, a good place to create QApplication is from
    within 'applicationDidFinishLaunching' inside your UIApplication
    delegate.

.. admonition:: Stackoverflow

  * `Run-time error for Qt application on iOS built via CMake <http://stackoverflow.com/a/25061034/2288008>`__

- ``QtQuick2Plugin`` conflict.

  Both ``plugins/qmltooling/libqmldbg_qtquick2.a`` and ``qml/QtQuick.2/libqtquick2plugin.a`` implement this plugin:

.. code-block:: none

    [Install]> nm -gU plugins/qmltooling/libqmldbg_qtquick2.a | grep static_plugin
    00000000000000b0 T __Z31qt_static_plugin_QtQuick2Pluginv

.. code-block:: none

    [Install]> nm -gU qml/QtQuick.2/libqtquick2plugin.a | grep static_plugin
    0000000000000080 T __Z31qt_static_plugin_QtQuick2Pluginv

Linking of ``libqmldbg_qtquick2.a`` may lead to the next runtime error:

.. code-block:: none

    module "QtQuick" plugin "qtquick2plugin" not found

if you see this error try to remove usage of target ``Qt5::QtQuick2Plugin`` and variable ``Qt5Qml_PLUGINS``.

-  Static QML plugins loading issue and workaround:
   https://bugreports.qt.io/browse/QTBUG-35754
-  iOS with ``armv7s`` architecture is broken:
   https://bugreports.qt.io/browse/QTBUG-48805
-  **Errors when compiling on Linux Debian** without manually installing
   some Qt dependencies first. See `Qt Issue
   2 <https://github.com/hunter-packages/Qt/issues/2>`__. The Problem
   can be fixed by installing the necessary libraries before calling
   CMake with the command:

   .. code-block:: none

       > sudo apt-get install libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev

-  Requirements for Ubuntu for Hunter v0.14.14+ (need ``GL``,\ ``EGL``:
   ``/usr/include/GL/gl.h``, ``usr/include/EGL/egl.h``):

   .. code-block:: none

       > sudo apt-get install libegl1-mesa-dev libgl1-mesa-dev libegl1-mesa-drivers

-  Extra libraries for Android tools on Ubuntu needed (see `this
   answer <http://superuser.com/a/360398/252568>`__)

Applied workaround for next bugs
--------------------------------

-  Default version of Xcode should not be set to ``7.0`` for Qt
   ``5.5.0``. See `bug
   #47383 <https://bugreports.qt.io/browse/QTBUG-47383>`__.

-  Hunter install extra module
   `Qt5Widgets\_HunterPlugin <https://github.com/ruslo/hunter/blob/develop/scripts/Qt5Widgets_HunterPlugin.cmake>`__
   to apply workarounds for bugs:
   `47349 <https://bugreports.qt.io/browse/QTBUG-47349>`__ and
   `47336 <https://bugreports.qt.io/browse/QTBUG-47336>`__.

-  Simulator's libraries not found by ``find_package``:
   `47314 <https://bugreports.qt.io/browse/QTBUG-47314>`__

-  Workaround for `bug
   #47453 <https://bugreports.qt.io/browse/QTBUG-47453>`__

Hints
-----

-  Set ``QT_DEBUG_PLUGINS=1`` environment variable to obtain some
   diagnostic info: http://doc.qt.io/qt-5.5/deployment-plugins.html
