.. spelling::

    class_loader

.. index:: ROS ; class_loader

.. _pkg.class_loader:

class_loader
============

-  `Official <https://official_class_loader>`__
-  `Official <https://github.com/ros/class_loader>`__
-  `Hunterized <https://github.com/hunter-packages/class_loader>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/class_loader/CMakeLists.txt>`__
-  Added by `Krasimir Georgiev <https://github.com/kgeorgiev93>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)
    - Contribution partially as part of work at `SeeByte Ltd. <http://www.seebyte.com>`__

`class_loader` must be compiled with `BUILD_SHARED_LIBS=ON` for both libraries that are registered as plugins and libraries that load those plugins at runtime. If linking against `class_loader` statically, plugins would not be loaded correctly at runtime, because both the plugin and the library loading it would use their own copy of `class_loader`.

.. literalinclude:: /../examples/class_loader/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
