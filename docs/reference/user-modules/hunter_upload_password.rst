.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

.. _hunter_upload_password:

hunter_upload_password
----------------------

This module helps to set uploading parameters for
:doc:`binary cache server </user-guides/hunter-user/github-cache-server>`.

If you want to use GitHub repository
``https://github.com/forexample/hunter-cache``
as a cache server and do uploads using bot ``ingenue`` this can be expressed by
code:

.. code-block:: cmake

  # ~/.config/Hunter/passwords.cmake

  hunter_upload_password(
      REPO_OWNER "forexample"
      REPO "hunter-cache"
      USERNAME "ingenue"
      PASSWORD "very-secured-github-token-here"
  )

Note that module is file with CMake code, so all regular commands available.
E.g. you can read password from environment variable:

.. code-block:: cmake

  # ~/.config/Hunter/passwords.cmake

  hunter_upload_password(
      REPO_OWNER "forexample"
      REPO "hunter-cache"
      USERNAME "ingenue"
      PASSWORD "$ENV{GITHUB_USER_PASSWORD}"
  )
