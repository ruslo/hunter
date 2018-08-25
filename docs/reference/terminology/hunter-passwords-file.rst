.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

Hunter passwords file
=====================

Hunter passwords file is a CMake module where user can set passwords
for accessing
:doc:`protected sources </user-guides/cmake-user/protected-sources>`
using
:doc:`hunter_http_password </reference/user-modules/hunter_http_password>`
function and for specifying
:doc:`uploading parameters </user-guides/hunter-user/github-cache-server>`
using
:doc:`hunter_upload_password </reference/user-modules/hunter_upload_password>`
function.

.. warning::

  This feature is available only if version of
  :doc:`CMake is 3.7+ </quick-start/cmake>`

Hunter will look for next paths (sorted by priority):

* Path specified by :ref:`HUNTER_PASSWORDS_PATH <hunter passwords path>`
  CMake variable

* Path specified by :ref:`HUNTER_PASSWORDS_PATH <hunter passwords path env>`
  environment variable

* Path based on ``HOME`` environment variable:
  ``$ENV{HOME}/.config/Hunter/passwords.cmake`` (including Windows hosts)

* Path based on ``USERPROFILE`` environment variable:
  ``$ENV{USERPROFILE}/.config/Hunter/passwords.cmake`` (Windows only hosts)
