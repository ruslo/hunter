error.unexpected.hunter_config
==============================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] Unexpected 'hunter_config' usage ...``

Explanation
-----------

- ``hunter_config`` designed to be used in a special file ``config.cmake``, which is loaded and analyzed internally by Hunter. Users must not call this function explicitly in ``CMakeLists.txt``. The only correct way to use this function is to create separate ``config.cmake`` file and load it by ``HunterGate``

What to do
----------

- Please take a look at `example <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`_

Developer notes
---------------

- Error can be suppressed by ``set(HUNTER_ALLOW_CONFIG_LOADING YES)`` while using in unit tests
