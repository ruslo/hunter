.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

Private data download
=====================

Using :doc:`hunter_private_data </reference/user-modules/hunter_private_data>`
module user can download files that are private for the current project, i.e.
some data that **will not be shared** with other projects. Unlike regular
packages such data is not injectable, i.e. user will not be able to add his own
code just by changing version of private data (well there even no such essence
as private data version). This feature is quite orthogonal to main Hunter
functionality and just use Hunter root directory and tools like stamps and
locks.

As an example you can download file for testing:

.. code-block:: cmake

  hunter_private_data(
      URL "https://example.com/myfile.txt"
      SHA1 "abcxxxxxx123"
      FILE "myfile.txt"
      LOCATION myfile_path
  )

  add_test(NAME foo COMMAND foo --text-file ${myfile_path})

File ``myfile.txt`` will be downloaded once to outside ``HUNTER_ROOT``
directory. When you create two build directories:

.. code-block:: none

  > rm -rf _builds
  > cmake -H. -B_builds/Debug -DCMAKE_BUILD_TYPE=Debug
  > cmake -H. -B_builds/Release -DCMAKE_BUILD_TYPE=Release

They both will share same ``myfile.txt`` file. If for example you switch to
different Git branch with different version of ``myfile.txt`` file Hunter will
download this version and create separate directory basing on new hash.
Same variable ``myfile_path`` will point to new location.

You can use
:doc:`hunter_private_data_password </reference/user-modules/hunter_private_data_password>`
module to specify credentials for downloading password protected data.

.. seealso::

  * :doc:`F.A.Q.: How to download private GitHub asset </faq/how-to-download-private-github-asset>`
