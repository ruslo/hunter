.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

How to download private GitHub asset?
-------------------------------------

If you want to download private GitHub asset you have to use GitHub API.
First you have to find out URL with asset id. For example get info about tag
``v3.2.1`` using ``curl`` command:

.. code-block:: none

  > curl -s -u \
      ${username}:${token} \
      https://api.github.com/repos/${orgname}/${reponame}/releases/tags/v3.2.1

Name, id and URL of asset:

.. code-block:: none
  :emphasize-lines: 6, 8

  > curl -s -u \
      ${username}:${token} \
      https://api.github.com/repos/${orgname}/${reponame}/releases/tags/v3.2.1 \
      | grep -A3 '"url":.*assets'

      "url": "https://api.github.com/repos/.../.../releases/assets/7654321",
      "id": 7654321,
      "name": "hello.txt",
      "label": null,

Use asset URL in
:doc:`hunter_private_data </reference/user-modules/hunter_private_data>` and
add extra ``Accept:application/octet-stream`` header:

.. code-block:: cmake
  :emphasize-lines: 4, 7

  # CMakeLists.txt

  hunter_private_data(
      URL "https://api.github.com/repos/${orgname}/${reponame}/releases/assets/7654321"
      SHA1 "..."
      CREDENTIALS "github"
      HTTPHEADER "Accept:application/octet-stream"
      FILE hello.txt
      LOCATION myfile
  )

Add GitHub credentials using
:doc:`hunter_private_data_password </reference/user-modules/hunter_private_data_password>`:

.. code-block:: cmake
  :emphasize-lines: 4

  # ~/.config/Hunter/passwords.cmake

  hunter_private_data_password(
      CREDENTIALS "github"
      USERNAME "${username}"
      PASSWORD "${github_token}"
  )

.. seealso::

  * `GitHub API: Get release by tag name <https://developer.github.com/v3/repos/releases/#get-a-release-by-tag-name>`__
  * `GitHub API: Get a single release asset <https://developer.github.com/v3/repos/releases/#get-a-single-release-asset>`__
