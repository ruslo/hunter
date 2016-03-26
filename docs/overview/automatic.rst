Automatic builds
----------------

Build instructions from Hunter archive triggered automatically when
``hunter_add_package`` function called. Hence there is no need to specify
dependencies in a raw ``README`` file like:

::

  For OSX please do:
  > brew install foo boo

  For Ubuntu please do:
  > sudo apt-get install foo boo

  Then run build:
  > cmake -H. -B_builds
  > cmake --build _builds

Now it's simply:

::

  Just run build:
  > cmake -H. -B_builds # dependencies installed automatically
  > cmake --build _builds

Optional dependency? No problems, expressed in a pretty clean way:

.. code-block:: cmake

  # required dependencies
  hunter_add_package(foo)
  hunter_add_package(boo)
  if(BUILD_WITH_BAR)
    hunter_add_package(bar)
  endif()

Same commands:

::

  > cmake -H. -B_builds -DBUILD_WITH_BAR=YES # + install bar

instead of:

::

  Additionally if you want bar support please run:
  > brew install bar # OSX
  > sudo apt-get install bar # Ubuntu

  Then run build:
  > cmake -H. -B_builds -DBUILD_WITH_BAR=YES
  
