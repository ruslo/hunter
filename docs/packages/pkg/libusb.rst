.. spelling::

    libusb

.. index::
  single: development ; libusb

.. _pkg.libusb:

libusb
======

-  `Official <https://libusb.info>`__
-  `Official GitHub <https://github.com/libusb/libusb>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/libusb/CMakeLists.txt>`__
-  Added by `Sebastien Collier <https://github.com/sjdrc>`__ (`pr-1830 <https://github.com/ruslo/hunter/pull/1830>`__)

.. literalinclude:: /../examples/libusb/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

Pitfalls
--------

- Requirements for Ubuntu:

.. code::

    sudo apt-get install libudev-dev
