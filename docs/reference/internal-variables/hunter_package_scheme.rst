.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. spelling::

  url
  sha

HUNTER_PACKAGE_SCHEME_<TYPE>
----------------------------

Type of the currently used scheme. Only one type should be set to ``1``, other
types should have empty values. Next table describe the difference between them:

+--------------------------------------+-------------------------+-------------------+----------+------------+
|                                      | name                    | <pkg>_ROOT        | EP? [1]_ | cache [2]_ |
+======================================+=========================+===================+==========+============+
| HUNTER_PACKAGE_SCHEME_DOWNLOAD       | url_sha1_download       | source directory  | no       | yes        |
+--------------------------------------+-------------------------+-------------------+----------+------------+
| HUNTER_PACKAGE_SCHEME_UNPACK         | url_sha1_unpack         | source directory  | yes      | yes        |
+--------------------------------------+-------------------------+-------------------+----------+------------+
| HUNTER_PACKAGE_SCHEME_UNPACK_INSTALL | url_sha1_unpack_install | install directory | yes      | yes        |
+--------------------------------------+-------------------------+-------------------+----------+------------+
| HUNTER_PACKAGE_SCHEME_INSTALL        | *other*                 | install directory | yes      | no         |
+--------------------------------------+-------------------------+-------------------+----------+------------+

.. [1] Does scheme use ExternalProject_Add? (information used while doing look up for stamps)
.. [2] Is package cacheable by default? Yes - always cacheable, No - depends on the package (see ``hunter_cacheable``)
