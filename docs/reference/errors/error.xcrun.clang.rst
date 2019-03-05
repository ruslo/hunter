.. spelling::

  xcode
  xcrun


error.xcrun.clang
=================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] 'xcrun -f clang++' failed``

What to do
----------

- ``xcrun`` [#]_ is a part of ``Xcode`` environment. Probably xcode is broken or not installed at all. May be `command line tools <http://stackoverflow.com/questions/9329243/xcode-4-4-and-later-install-command-line-tools>`_ need to be installed also. After that, simply check that ``xcrun -f clang++`` returns the full path to clang compiler. See also ``xcode-select`` [#]_.

.. [#] https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcrun.1.html
.. [#] https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcode-select.1.html
