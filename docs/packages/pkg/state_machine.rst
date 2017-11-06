.. spelling::

    state_machine

.. index:: unsorted ; state_machine

.. _pkg.state_machine:

state_machine
=============

-  `Official <https://github.com/NukeBird/state_machine>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/state_machine/CMakeLists.txt>`__
-  Added by `NukeBird <https://github.com/NukeBird>`__ (`pr-1163 <https://github.com/ruslo/hunter/pull/1163>`__)

.. code-block:: cmake

	hunter_add_package(state_machine)
	find_package(state_machine CONFIG REQUIRED)
	target_link_libraries(sm state_machine)
