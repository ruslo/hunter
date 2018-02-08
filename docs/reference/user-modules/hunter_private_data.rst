.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

hunter_private_data
-------------------

This module helps to download user's
:doc:`private data </user-guides/cmake-user/private-data>`.

Private file that is available without specifying password:

.. code-block:: cmake
  :emphasize-lines: 4, 6

  # CMakeLists.txt

  hunter_private_data(
      URL "https://example.com/myfile.txt"
      SHA1 "abcxxxxxx123"
      FILE "myfile.txt"
      LOCATION myfile_path
  )

.. warning::

  Changing name specified in ``FILE`` or enabling/disabling ``FILE`` is not
  allowed after download done.

Variable ``myfile_path`` can be used now, for example in test:

.. code-block:: cmake

  add_test(NAME foo COMMAND foo --text-file ${myfile_path})

If ``FILE`` is not specified then archive is assumed. Hunter will unpack it
and return path to unpacked directory in ``LOCATION`` variable:

.. code-block:: cmake
  :emphasize-lines: 6, 13-14

  # CMakeLists.txt

  hunter_private_data(
      URL "https://example.com/archive.tar.gz"
      SHA1 "abcxxxxxx123"
      LOCATION mydata_dir
  )

  add_test(
      NAME foo
      COMMAND
      foo
      --text-file ${mydata_dir}/poem.txt
      --image-file ${mydata_dir}/cat.png
  )

If you need to download file protected with password you have to add
``CREDENTIALS``:

.. code-block:: cmake
  :emphasize-lines: 4

  hunter_private_data(
      URL "https://example.com/archive.tar.gz"
      SHA1 "abcxxxxxx123"
      CREDENTIALS "creds"
      LOCATION mydata_dir
  )

And add corresponding entry in
:doc:`Hunter passwords file </reference/terminology/hunter-passwords-file>`
using
:doc:`hunter_private_data_password </reference/user-modules/hunter_private_data_password>`
module:

.. code-block:: cmake
  :emphasize-lines: 4

  # ~/.config/Hunter/passwords.cmake

  hunter_private_data_password(
      CREDENTIALS "creds"
      USERNAME "..."
      PASSWORD "..."
  )

.. seealso::

  * :doc:`F.A.Q.: How to download private GitHub asset </faq/how-to-download-private-github-asset>`
