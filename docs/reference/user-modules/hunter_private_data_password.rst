.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

hunter_private_data_password
----------------------------

This module helps to set credentials for downloading
:doc:`private data </user-guides/cmake-user/private-data>`.

For each
:doc:`hunter_private_data </reference/user-modules/hunter_private_data>`
with ``CREDENTIALS``:

.. code-block:: cmake
  :emphasize-lines: 6, 13

  # CMakeLists.txt

  hunter_private_data(
      URL "..."
      SHA1 "..."
      CREDENTIALS "creds_A"
      LOCATION my_data_A
  )

  hunter_private_data(
      URL "..."
      SHA1 "..."
      CREDENTIALS "creds_B"
      LOCATION my_data_B
  )

You have to define corresponding entry with ``USERNAME`` and ``PASSWORD``:

.. code-block:: cmake
  :emphasize-lines: 4, 10

  # ~/.config/Hunter/passwords.cmake

  hunter_private_data_password(
      CREDENTIALS "creds_A"
      USERNAME "..."
      PASSWORD "..."
  )

  hunter_private_data_password(
      CREDENTIALS "creds_B"
      USERNAME "..."
      PASSWORD "..."
  )

Same ``CREDENTIALS`` can be used in several entries, e.g. you can download
all private GitHub data using your account name and token:

.. code-block:: cmake
  :emphasize-lines: 6, 14

  # CMakeLists.txt

  hunter_private_data(
      URL "https://api.github.com/repos/${repo}/${project}/releases/assets/${asset_id_1}"
      SHA1 "${asset_id_1_sha1}"
      CREDENTIALS "github"
      HTTPHEADER "Accept:application/octet-stream"
      LOCATION asset_1
  )

  hunter_private_data(
      URL "https://api.github.com/repos/${repo}/${project}/releases/assets/${asset_id_2}"
      SHA1 "${asset_id_2_sha1}"
      CREDENTIALS "github"
      HTTPHEADER "Accept:application/octet-stream"
      LOCATION asset_2
  )

.. code-block:: cmake
  :emphasize-lines: 4

  # ~/.config/Hunter/passwords.cmake

  hunter_private_data_password(
      CREDENTIALS "github"
      USERNAME "${username}"
      PASSWORD "${username_github_token}"
  )

.. seealso::

  * :doc:`F.A.Q.: How to download private GitHub asset </faq/how-to-download-private-github-asset>`
