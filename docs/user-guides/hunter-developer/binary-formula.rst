.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

Binary formula
--------------

.. code-block:: none

  SHA1(toolchain.info)
  + SHA1(archive with sources)
  + SHA1(args.cmake)
  + SHA1(types.info)
  + SHA1(internal_deps.id)
  + SHA1(deps.info)
  = cache.sha1

In terms of :ref:`cache <layout deployed cache>`:

.. code-block:: none

  Toolchain-ID
  + Archive-ID
  + Args-ID
  + Types-ID
  + Internal-Deps-ID
  + Deps-ID
  = SHA1 of binaries

.. note::

  ``*-ID`` checked for collision, see
  :ref:`Layout common <layout deployed common>`.

Hunter-ID
=========

.. seealso::

  * :doc:`Hunter-ID </overview/customization/hunter-id>`

Version -> SHA1 mapping: ``Config-ID`` can have only ``VERSION``, SHA1
of sources will be taken from ``hunter.cmake``.
I.e. ``Hunter-ID`` + ``Config-ID`` -> ``Archive-ID``.

``hunter.cmake`` can contain default CMake arguments for a package. Resulting
arguments will be created by merging default arguments from ``hunter.cmake``
(low priority) and user arguments from ``Config-ID`` (high priority).  I.e.
``Hunter-ID`` + ``Config-ID`` -> ``Args-ID``.

``hunter.cmake`` can contain default configuration types
(``Release``/``Debug``/etc.) for a package. Resulting configuration types will
be created by analyzing ``HUNTER_CONFIGURATION_TYPES`` (low priority), default
configuration types from ``hunter.cmake`` (high priority) and user configuration
types from ``Config-ID`` (highest priority). I.e.
``Hunter-ID`` + ``Toolchain-ID`` + ``Config-ID`` -> ``Types-ID``.

.. seealso::

  * `hunter_get_configuration_types <https://github.com/ruslo/hunter/blob/50330c772ad57eeb6495b2d61985e57eeaa450e4/cmake/modules/hunter_get_configuration_types.cmake#L30-L45>`__

``hunter.cmake`` can contain
:doc:`PACKAGE_INTERNAL_DEPS_ID </reference/user-modules/hunter_download>`.
This variable used only for custom non-CMake build schemes:
``Hunter-ID`` -> ``Internal-Deps-ID``.

Toolchain-ID
============

.. seealso::

  * :doc:`Toolchain-ID </overview/customization/toolchain-id>`

Global settings for all packages, no package specific information saved here.
Created by analyzing an output of compilation of C++ file
`ShowPredefined.cpp <https://github.com/ruslo/hunter/blob/50330c772ad57eeb6495b2d61985e57eeaa450e4/scripts/ShowPredefined.cpp>`__
(created from
`list <https://github.com/ruslo/hunter/blob/50330c772ad57eeb6495b2d61985e57eeaa450e4/scripts/predefined.list>`__).
We get unified information about compiler, compiler version, compiler
flags, etc. (everything from user's ``CMAKE_TOOLCHAIN_FILE``).

Additionally next global variables
`saved there too <https://github.com/ruslo/hunter/blob/50330c772ad57eeb6495b2d61985e57eeaa450e4/scripts/create-toolchain-info.cmake#L34-L69>`__:

* ``IPHONEOS_ARCHS`` (Polly toolchains)
* ``IPHONESIMULATOR_ARCHS`` (Polly toolchains)
* ``CMAKE_GENERATOR``
* ``HUNTER_CONFIGURATION_TYPES``
* ``HUNTER_TOOLCHAIN_UNDETECTABLE_ID``
* ``HUNTER_BUILD_SHARED_LIBS``
* ``OSX_SDK_VERSION`` (Polly toolchains)

Config-ID
=========

Package specific information saved here. Created by merging file with
`hunter_default_version commands <https://github.com/ruslo/hunter/blob/50330c772ad57eeb6495b2d61985e57eeaa450e4/cmake/configs/default.cmake>`__
and user's ``config.cmake`` with ``hunter_config`` commands (if present).
Result is automatically generated ``config.cmake`` file with
``hunter_final_config`` command. First 7 digits of SHA1 of ``config.cmake``
forms ``Config-ID``.  Used while calculating ``Archive-ID``, ``Args-ID``,
``Types-ID`` (see above).
