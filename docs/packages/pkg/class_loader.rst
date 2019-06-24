.. spelling::

    class_loader

.. index:: ROS ; class_loader

.. _pkg.class_loader:

class_loader
============

-  `Official <https://github.com/ros/class_loader>`__
-  `Hunterized <https://github.com/hunter-packages/class_loader>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/class_loader/CMakeLists.txt>`__
-  Added by `Krasimir Georgiev <https://github.com/kgeorgiev93>`__ (`pr-1899 <https://github.com/ruslo/hunter/pull/1899>`__)
    - Contribution partially as part of work at `SeeByte Ltd. <http://www.seebyte.com>`__

By default ``BUILD_SHARED_LIBS=ON`` used for ``class_loader`` because if linking
against ``class_loader`` statically, plugins would not be loaded correctly at
runtime, because both the plugin and the library loading it would use their own
copy of ``class_loader``.

.. literalinclude:: /../examples/class_loader/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
