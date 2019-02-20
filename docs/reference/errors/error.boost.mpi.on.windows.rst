.. spelling::

  mpi
  rst


error.boost.mpi.on.windows
==========================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] MPI is required``

What to do
----------

- Current boost.mpi version on windows tested with MS-MPI [#]_, please install it (``msmpisdk.msi``), check that the command ``find_package(MPI REQUIRED)`` successfully works then re-run build of CMake project which use hunter

.. [#] http://msdn.microsoft.com/en-us/library/bb524831%28v=vs.85%29.aspx
