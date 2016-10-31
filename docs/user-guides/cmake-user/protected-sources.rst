.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Protected sources
-----------------

.. warning::

  This feature is available only if version of
  :doc:`CMake is 3.7+ </quick-start/cmake>`

Hunter can manage access to the package with sources protected by HTTP
user-name/password credentials. Such packages should be
:doc:`marked as protected </reference/user-modules/hunter_protected_sources>`
in corresponding ``hunter.cmake`` file. Passwords for protected sources can be
set by file with :doc:`/reference/user-modules/hunter_http_password` commands.
Next paths will be checked (sorted by priority):

* Path specified by :ref:`HUNTER_PASSWORDS_PATH <hunter passwords path>`
  CMake variable

* Path specified by :ref:`HUNTER_PASSWORDS_PATH <hunter passwords path env>`
  environment variable

* Path based on ``HOME`` environment variable:
  ``$ENV{HOME}/.config/Hunter/passwords.cmake`` (including Windows hosts)

* Path based on ``USERPROFILE`` environment variable:
  ``$ENV{USERPROFILE}/.config/Hunter/passwords.cmake`` (Windows only hosts)

Hint for GitHub users
=====================

You don't have to store your personal password in ``passwords.cmake`` file.
Instead you can generate
`personal access token <https://help.github.com/articles/creating-an-access-token-for-command-line-use/>`__
and use it as ``PASSWORD``:

.. code-block:: cmake

  hunter_http_password(Foo USERNAME "myname" PASSWORD "123...abc")

.. note::

  Since token used to access private repositories you have to set ``repo``
  scope ("Full control of private repositories"):

  .. image:: /user-guides/images/repo-scope.png
