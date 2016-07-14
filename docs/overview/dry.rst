Don't Repeat Yourself
---------------------

If you already familiar with `ExternalProject_Add`_ and have wrote some
super-build projects before you probably already awared that writing complete
solution with toolchains, build types, build options, parallel jobs,
forwarding of compiler flags and making it works correctly for all generators
is not a trivial task.

Hunter store `ExternalProject_Add`_ recipies as a set of templates. Once
written formula (`build scheme`_) can be reused by other projects without
copying of collection of superbuild files (`DRY principle`_).
When new package with new scheme introduced all you need to do is just update
``SHA1``/``URL`` of ``HunterGate`` command.

.. admonition:: Stackoverflow

  * `How to use CMake ExternalProject_Add or alternatives in a cross platform way? <http://stackoverflow.com/questions/16842218>`_

.. _ExternalProject_Add: http://www.cmake.org/cmake/help/v3.2/module/ExternalProject.html
.. _build scheme: https://github.com/ruslo/hunter/tree/master/cmake/schemes
.. _DRY principle: http://c2.com/cgi/wiki?DontRepeatYourself
