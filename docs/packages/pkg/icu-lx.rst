.. spelling::

    icu
    lx

.. index::
  single: unsorted ; icu-lx

.. _pkg.icu-lx:

icu-lx
======

- http://site.icu-project.org
- `Hunterized <https://github.com/hunter-packages/icu-lx>`__
- `Example <https://github.com/ruslo/hunter/blob/master/examples/icu-lx/CMakeLists.txt>`__

This library is part of the ICU project and separated from the main
:ref:`ICU <pkg.icu>` package to break a circular dependency
(see `documentation <http://userguide.icu-project.org/layoutengine/paragraph>`__):

- :ref:`ICU (with lx) <pkg.icu>` -> :ref:`icu-le-hb <pkg.icu-le-hb>` -> :ref:`harfbuzz <pkg.harfbuzz>` -> :ref:`ICU (without lx) <pkg.icu>`

.. literalinclude:: /../examples/icu-lx/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
