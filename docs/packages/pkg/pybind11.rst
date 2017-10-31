.. spelling::

    pybind
    pybind11

.. index:: scripting ; pybind11

.. _pkg.pybind11:

pybind11
========

-  `Official <https://github.com/pybind/pybind11>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/pybind11/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1140 <https://github.com/ruslo/hunter/pull/1140>`__)

.. code-block:: cmake

    hunter_add_package(pybind11)
    find_package(pybind11 CONFIG REQUIRED)
    target_link_libraries(... pybind11::pybind11 pybind11::embed pybind11::module)
