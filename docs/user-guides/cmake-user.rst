.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

CMake user
----------

This kind of developer can **read** CMake code that was written by more
experienced CMake developer. He understand some simple features like that
executable added by ``add_executable`` command and this command contains list
of sources files.  But probably will not be able to tell why in some cases
``include_directories`` command called but ``target_include_directories`` in
other cases. The main target of modifications is C++ code.

Such developers can do:

* Add more targets to project
* Add more sources to targets
* Add C++ flags that doesn't break compatibility (e.g. warnings/optimization)

Such developers can't do:

* Add more external dependencies to project
* Adding flags that can break compatibility (e.g. ``-std=c++11`` or ``/MT``)

See also:

.. toctree::
  :maxdepth: 1

  Provide credentials to access protected sources <cmake-user/protected-sources>
  Using license files <cmake-user/using-license-files>
