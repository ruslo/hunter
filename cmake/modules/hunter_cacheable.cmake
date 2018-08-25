# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_assert_empty_string)

function(hunter_cacheable package)
  hunter_assert_empty_string("${ARGN}")
  hunter_assert_not_empty_string("${package}")

  set("__HUNTER_CACHEABLE_${package}" TRUE PARENT_SCOPE)
endfunction()
