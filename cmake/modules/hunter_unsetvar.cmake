# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

macro(hunter_unsetvar varname)
  unset("${varname}")
  unset("${varname}" CACHE)
  unset("ENV{${varname}}")
endmacro()

# vim:set shiftwidth=2 tabstop=2 softtabstop=2 expandtab:
