.. spelling::

  perl
  openssl


error.openssl.perl.not.found
============================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] OpenSSL: perl not found``.
  Perl is *mandatory* [#]_ for installation on Windows.

What to do
----------

- `Install perl <http://www.activestate.com/activeperl>`_
- Probably restart will needed

.. [#] https://github.com/openssl/openssl/blob/master/INSTALL.W32
