.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Protected sources
-----------------

Hunter can manage access to the package with sources protected by HTTP
user-name/password credentials. Such packages should be
:doc:`marked as protected </reference/user-modules/hunter_protected_sources>`
in corresponding ``hunter.cmake`` file. Passwords should be set in
:doc:`Hunter passwords file </reference/terminology/hunter-passwords-file>`
using
:doc:`hunter_http_password </reference/user-modules/hunter_http_password>`
function.

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
