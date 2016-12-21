.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. spelling::

  http

hunter_http_password
--------------------

This module helps to set user-name/password for packages with
:doc:`protected sources </user-guides/cmake-user/protected-sources>`.

If package ``Foo`` has protected sources and can be accessed by setting
HTTP user-name to ``myname`` and HTTP password to ``mypassword``, this can
be expressed by code:

.. code-block:: cmake

  # ~/.config/Hunter/passwords.cmake

  hunter_http_password(Foo USERNAME "myname" PASSWORD "mypassword")

Note that module is file with CMake code, so all regular commands available:

.. code-block:: cmake

  # ~/.config/Hunter/passwords.cmake

  foreach(package Foo Boo Bar)
    hunter_http_password("${package}" USERNAME "myname" PASSWORD "mypassword")
  endforeach()

.. code-block:: cmake

  # ~/.config/Hunter/passwords.cmake

  set(user "myname")

  set(pass1 "mypassword1")
  set(pass2 "mypassword2")

  foreach(package Foo1 Boo1 Bar1)
    hunter_http_password("${package}" USERNAME "${user}" PASSWORD "${pass1}")
  endforeach()

  foreach(package Foo2 Boo2 Bar2)
    hunter_http_password("${package}" USERNAME "${user}" PASSWORD "${pass2}")
  endforeach()
