error.spaces.in.hunter.root
===========================

What happens
------------

- CMake fatal error with message::

    [hunter ** FATAL ERROR **] HUNTER_ROOT (...) contains spaces

Explanation
-----------

- Though CMake works fine with spaces (hence Hunter) some packages doesn't work with paths which contain space symbols. Examples:

    - `OpenSSL <https://github.com/openssl/openssl/pull/185>`_
    - |Qt no spaces|_
    - `Boost MINGW <http://article.gmane.org/gmane.comp.lib.boost.devel/259156>`_

.. |Qt no spaces| replace:: Qt (see: ``The install path must not contain any spaces``)
.. _Qt no spaces: http://doc.qt.io/qt-5/windows-building.html

What to do
----------

- Set another ``HUNTER_ROOT`` `location <https://docs.hunter.sh/en/latest/reference/errors/error.detect.hunter.root.html>`_ (**recommended**)
- Set ``HUNTER_ALLOW_SPACES_IN_PATH=ON`` CMake variable to suppress this warning (**not** recommended)
