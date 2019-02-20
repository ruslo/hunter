# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)

function(hunter_user_error)
  hunter_fatal_error(${ARGV} ERROR_PAGE "error.incorrect.input.data")
endfunction()
