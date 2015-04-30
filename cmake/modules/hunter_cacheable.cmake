# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_test_string_not_empty)

macro(hunter_cacheable package)
  hunter_test_string_not_empty("${package}")
  set(HUNTER_${package}_CACHEABLE TRUE)
endmacro()
