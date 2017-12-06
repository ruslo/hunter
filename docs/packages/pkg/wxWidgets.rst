.. spelling::

    wxWidgets

.. index:: ui ; wxWidgets

.. _pkg.wxWidgets:

wxWidgets
=========

-  `Official <https://github.com/wxWidgets/wxWidgets>`__
-  `Hunterized <https://github.com/alamaison/wxWidgets>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/wxWidgets/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(wxWidgets)

    find_package(wxWidgets REQUIRED core base)
    include(${wxWidgets_USE_FILE})
    target_link_libraries(... ${wxWidgets_LIBRARIES})

Issues
------

-  `Add GTK <https://github.com/ruslo/hunter/issues/119>`__
-  `Add OpenGL <https://github.com/ruslo/hunter/issues/120>`__
-  Does it work on OS X? `CMakeified wxWidgets hasn't had its OSX
   Bakefiles ported <https://github.com/ruslo/hunter/pull/118>`__
