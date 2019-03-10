.. spelling::

  OpenSSL

error.external.build.failed
===========================

What happens
------------

- CMake fatal error with one of the messages:

    - ``[hunter ** FATAL ERROR **] Configure step failed (dir: ...)``
    - ``[hunter ** FATAL ERROR **] Build step failed (dir: ...)``

Explanation
-----------

- Build of some external package failed for some reason

What to do
----------

- Find a reason of failure. Set
  :ref:`HUNTER_STATUS_DEBUG=ON <hunter_status_debug>`
  to see a lot of info about build
- Take a look at
  `pkg.NAME <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=pkg>`_
  CI testing table. If similar toolchain is excluded (or not present at all)
  then the problem is known, hence **there is no need to report bug if you're
  not planning to fix it yourself**.
  For example if you check the OpenSSL testing:

    - https://github.com/ingenue/hunter/tree/pkg.openssl

  You can see that toolchain ``nmake-vs-12-2013-win64`` is excluded already:

    - https://github.com/ingenue/hunter/blob/2bdb775aa312e1634c545aa772f09730f61e2e7b/appveyor.yml#L17-L20

  So there is no need to report "OpenSSL is not working with NMake" issue.

- If you want to try to fix the error and want to ask for advice, then prefer
  reporting it to `hunterized repository <https://github.com/hunter-packages>`_
  (if it exist for package). For example report Boost problems to
  https://github.com/hunter-packages/boost .
  Stale bugs with label "Broken package" will be closed if there will be no
  activity there **even if problem may not be fixed**.

Fixable errors
--------------

.. _windows path too long:

Windows
```````

- "Path too long" error with message:

.. code-block:: none

  The specified path, file name, or both are too long.  The fully qualified
  file name must be less than 260 characters, and the directory name must be
  less than 248 characters.


Can be fixed by setting :ref:`HUNTER_ROOT <env hunter root>` environment variable to some short path,
like ``C:\_hunter``. Alternatively you can set :ref:`HUNTER_BINARY_DIR <env hunter binary dir>`
environment variable. In this case all installed packages will be kept in ``HUNTER_ROOT``
but all builds will be triggered in ``HUNTER_BINARY_DIR``. Note that if several
``Hunter-ID`` will be send to ``HUNTER_BINARY_DIR`` they will block each other and
will be build sequentially (builds in ``HUNTER_ROOT`` lock different directories
so different ``Hunter-ID`` instances work in parallel). Note that the problem is
about native build tool (like `MSBuild <https://github.com/Microsoft/msbuild/issues/53#issuecomment-459062618>`__)
and not in CMake. CMake is already using ``\\?\C:\`` `extended-length path <https://msdn.microsoft.com/en-us/library/aa365247.aspx#maxpath>`__
format (see `source code <https://github.com/Kitware/CMake/blob/cec6e3e9eb9861a3a1a0fd7a3972fa36dd6b9996/Source/kwsys/SystemTools.cxx#L2003>`_).

Mac OS X
````````

- Runtime application error::

    Unknown class * in Interface Builder file at path *.nib

  Check you have next flags linked to your target:

  .. code-block:: cmake

     target_link_libraries(... "-all_load" "-ObjC")

- `Stackoverflow question <http://stackoverflow.com/questions/1725881>`_

Reproduce and diagnose package building errors manually
-------------------------------------------------------

 .. warning::
    This may not work always since Hunter can load extra environment variables in internal scripts.

Once you enabled ``HUNTER_STATUS_DEBUG``, read the error output in order to find how to build the package manually and to reproduce the error.
Read the output of CMake near the error::

    [hunter ** FATAL ERROR **] Build step failed (dir: ~/.hunter/_Base/21f5129/d74d0a3/11f31d2/Build/PocoCpp
    [hunter ** FATAL ERROR **] [Directory:~/.hunter/_Base/Download/Hunter/0.19.90/21f5129/Unpacked/cmake/projects/PocoCpp]

    ------------------------------ WIKI -------------------------------
        https://github.com/ruslo/hunter/wiki/error.external.build.failed
    -------------------------------------------------------------------

    CMake Error at ~/.hunter/_Base/Download/Hunter/0.19.90/21f5129/Unpacked/cmake/modules/hunter_wiki.cmake:12 (message):
    Call Stack (most recent call first):
      ~/.hunter/_Base/Download/Hunter/0.19.90/21f5129/Unpacked/cmake/modules/hunter_fatal_error.cmake:20 (hunter_wiki)
      ...

Carefully note the directory that is given near the message "build step failed", and build it, like shown below

.. code-block:: bash

   # this is the directory given by the error message
   cd ~/.hunter/_Base/21f5129/d74d0a3/11f31d2/Build/PocoCpp
   cmake --build Build/

Then, you can diagnose more easily the cause of the error, using you standard build tools.
