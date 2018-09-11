.. spelling::

    Vulkan
    VulkanMemoryAllocator
    debian
    dev
    libvulkan
    vulkan

.. index::
  single: graphics ; VulkanMemoryAllocator

.. _pkg.VulkanMemoryAllocator:

VulkanMemoryAllocator
=====================

-  `Official <https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator>`__
-  `Hunterized <https://github.com/hunter-packages/VulkanMemoryAllocator>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/VulkanMemoryAllocator/CMakeLists.txt>`__
-  Added by `Jon Spencer <https://github.com/jhs67>`__ (`pr-1509 <https://github.com/ruslo/hunter/pull/1509>`__)

To use this package the vulkan headers (not part of Hunter at the time of writing) must be installed.
On debian variants use "apt-get install libvulkan-dev".  On Mac, Windows, and iOS download and
install the Vulkan SDK from `here <https://www.lunarg.com/vulkan-sdk/>`__.
Recent versions of the android NDK supports Vulkan out of the box.

.. literalinclude:: /../examples/VulkanMemoryAllocator/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
