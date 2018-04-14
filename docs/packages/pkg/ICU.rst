.. spelling::

    ICU

.. index:: unsorted ; ICU

.. _pkg.ICU:

ICU
===

- http://site.icu-project.org/
- `Hunterized <https://github.com/hunter-packages/icu>`__
- `Example <https://github.com/ruslo/hunter/blob/master/examples/ICU/CMakeLists.txt>`__
- `Stand-alone example with advanced testing <https://github.com/forexample/icu-sample>`__

.. literalinclude:: /../examples/ICU/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

Available targets:

* ``ICU::data``
* ``ICU::i18n``
* ``ICU::io`` (only if ``ICU_BUILD_IO=YES``)
* ``ICU::le``
* ``ICU::lx``
* ``ICU::tu`` (only if ``ICU_BUILD_TOOLS=YES``)
* ``ICU::uc``
* ``ICU::pkgdata`` (only if ``ICU_BUILD_TOOLS=YES``)
* ``ICU::icupkg`` (only if ``ICU_BUILD_TOOLS=YES``)

If ``ICU_BUILD_TOOLS`` is set to ``YES`` also next variables available:

* ``ICU_PKGDATA_EXECUTABLE``
* ``ICU_ICUPKG_EXECUTABLE``

If ``ICU_DATA_ARCHIVE_MODE`` is set to ``YES`` also next variables available:

* ``ICU_DATA_FILE``

Options:

* ``ICU_DATA_ARCHIVE_MODE=ON`` (equals to ``--with-data-packaging=archive``)
