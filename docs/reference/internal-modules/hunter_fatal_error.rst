.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

hunter_fatal_error
------------------

Wrapper for the ``message(FATAL_ERROR ...)`` command. Message marked as one
from Hunter by adding prefix ``[hunter ** FATAL ERROR **]``. Additionally
current module directory printed. This command expects ``WIKI`` argument which
will link to the page with detailed description of the problem. For example:

.. code-block:: cmake

  hunter_fatal_error(
      "Please set hunter_add_package *after* project command"
      WIKI "error.hunteraddpackage.after.project"
  )

will convert

* ``error.hunteraddpackage.after.project``

to

* https://github.com/ruslo/hunter/wiki/error.hunteraddpackage.after.project
