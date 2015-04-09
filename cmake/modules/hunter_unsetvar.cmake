# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

macro(hunter_unsetvar varname)
  unset("${varname}")
  unset("${varname}" CACHE)
  unset("ENV{${varname}}")
endmacro()
