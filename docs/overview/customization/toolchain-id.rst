Toolchain-ID
------------

Third level of customization. Compiler and flags.

Each build can be run with different toolchains.  In general the result is
completely different root ``lib``/``include`` directories.  For example on
Windows you can simultaniously build Visual Studio (32/64), NMake, Cygwin and
MinGW projects, on Linux GCC/Clang, on Mac Xcode, Makefile, iOS. Or choose
various clang tools like static analyzer/sanitizers and other platforms like
Android/Raspberry Pi. Each toolchain file will be forwarded to external project
so if you create toolchain with compiler ``g++`` and flag ``-std=c++11`` all
dependent projects will be built by ``g++ -std=c++11``. Information about
toolchain has some internal representation (``toolchain.info``) and user can
see first 7 digits (ID) of ``SHA1`` hash of this file.

+-------------------+-------------------+
| Hunter-ID 1eae623 | Config-ID 0fa873a |
+-------------------+-------------------+

+--------------+--------------------------------------------------------------------------+
| Toolchain-ID |                                                                          |
+==============+===================+======================================================+
| ``d46ea0b``  | Working directory | ``${HUNTER_ROOT}/_Base/1eae623/0fa873a/d46ea0b/...`` |
|              +-------------------+-----------+----------------+-------------------------+
|              |                   | Compiler  | Flags          |                         |
|              +-------------------+-----------+----------------+-------------------------+
|              |                   |  ``gcc``  |                |                         |
+--------------+-------------------+-----------+----------------+-------------------------+
| ``c018e63``  | Working directory | ``${HUNTER_ROOT}/_Base/1eae623/0fa873a/c018e63/...`` |
|              +-------------------+-----------+----------------+-------------------------+
|              |                   | Compiler  | Flags          |                         |
|              +-------------------+-----------+----------------+-------------------------+
|              |                   | ``clang`` |                |                         |
+--------------+-------------------+-----------+----------------+-------------------------+
| ``c39da39``  | Working directory | ``${HUNTER_ROOT}/_Base/1eae623/0fa873a/c39da39/...`` |
|              +-------------------+-----------+----------------+-------------------------+
|              |                   | Compiler  | Flags          |                         |
|              +-------------------+-----------+----------------+-------------------------+
|              |                   | ``clang`` | ``-std=c++11`` |                         |
+--------------+-------------------+-----------+----------------+-------------------------+


Message in logs:

::

  -- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: d46ea0b ]
  -- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: c018e63 ]
  -- [hunter] [ Hunter-ID: 1eae623 | Config-ID: 0fa873a | Toolchain-ID: c39da39 ]

.. admonition:: Examples on GitHub

  * `Android example <https://github.com/forexample/android-cmake>`__

.. admonition:: CGold

  * `Platforms <http://cgold.readthedocs.io/en/latest/platforms.html>`__

.. admonition:: Polly

  * `Collection of toolchains <https://github.com/ruslo/polly>`__
