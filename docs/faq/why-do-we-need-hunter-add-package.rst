Why do we need hunter_add_package?
----------------------------------

Usually ``hunter_add_package(foo)`` call placed right before similar
``find_package(foo ...)`` call, hence it raise the question: "If most of the
information is inside ``find_package`` already will it be possible to get rid
of the ``hunter_add_package``?".

TL;DR It is possible but implementation will be tricky and usefulness of such
feature in practice is quite questionable.

* Not all type of packages does found by ``find_package``. For example extra
  sources or data for testing use ``*_ROOT`` variables which added to the
  current scope by ``hunter_add_package``:

  .. code-block:: cmake

    hunter_add_package(foo_extra)
    add_subdirectory(${FOO_EXTRA_ROOT})

    hunter_add_package(foo_data)
    add_test(NAME foo_test COMMAND foo --use-data "${FOO_DATA_ROOT}/pic.png")

  Meaning that ``hunter_add_package`` will still exist and user will have to
  remember that sometimes magical download hook is inside ``find_package`` and
  sometimes ``hunter_add_package`` have to be called explicitly.

* Mixing unrelated functionality. ``hunter_add_package(foo)`` will download
  and install ``foo`` package while ``find_package(foo)`` should only look up
  for files in read-only mode. When user see the code like this:

  .. code-block:: cmake

    hunter_add_package(foo)
    find_package(foo 1.22 CONFIG REQUIRED)

  It's clear here that version ``1.22`` will not be used while downloading
  package since it goes **after** ``hunter_add_package`` call and result of
  ``hunter_add_package`` call is an installed package. If package will be
  installed by hook in ``find_package``:

  .. code-block:: cmake

    find_package(foo 1.22 CONFIG REQUIRED)

  User might got a feeling that version ``1.22`` is installed, which is not
  guaranteed.

* The change of ``find_package`` behavior will have fragile implementation. As
  an example: you can introduce custom macro ``find_package`` and call standard
  CMake instructions by using ``_find_package``. It's undocumented CMake
  feature of saving previous function under underscore starting name.
  Overwriting standard CMake calls simply look like a hack in my opinion. I
  think if you have an idea that can be solved this way, then it make sense to
  either design and implement it in CMake itself or don't touch original code
  and wrap your extra functionality in separate function. As you understand
  Hunter pick the latter. Also this approach will not work if user will
  introduce his own custom ``find_package`` hook, or will use
  ``include(FindXXX)``/``find_library``. All this are errors that should be
  fixed anyway but it just show an example that you will have to patch the
  original code effectively nullifying the benefits of this hook.

* As showed in :doc:`F.A.Q.: Why do we need forks? </faq/why-do-we-need-forks>`
  the adding of ``hunter_add_package`` is a relatively quite small amount of
  code comparing to the rest of the patch needed in practice. Such optimization
  is only look useful at the first glance. If you try to do few practical
  examples you will see that it's not a big deal and not worth optimization at
  all, at least for now.

So the choice here is between a clean, simple and universal solution introduced
by ``hunter_add_package`` and tricky, undocumented, surprising for user
implementation that will still not cover all the scenarios.
