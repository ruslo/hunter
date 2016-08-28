.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

How does Hunter interact with other package managers?
=====================================================

Mixing package managers in general is a bad idea (see for example
`Macports and Homebrew <http://superuser.com/q/181337/252568>`__). Such approach
may lead to :ref:`conflicts <dependencies conflict>`, violates
:doc:`automatic downloads principle </overview/automatic>` and make impossible
the usage of central server with binaries because information about dependency
will not be saved. Also it does break reproducibility feature of Hunter since
version of system package may differs for different OS, e.g. default version
of Boost on ``Ubuntu 14.04`` is ``1.54.0`` and for ``Ubuntu 16.04``
it's ``1.58.0``.

Note that Hunter can install packages in the same way as regular package
managers do: you can set all build types to ``Release``, ``BUILD_SHARED_LIBS=ON``
and upload binaries to public. So the question
``How to make Hunter interact with system libraries?`` should really be
``How to improve Hunter so it behaves like system package manager?``, e.g.
add new packages that are currently missing.

.. seealso::

  * `Feature requests: use system packages <https://github.com/ruslo/hunter/issues/501>`__
