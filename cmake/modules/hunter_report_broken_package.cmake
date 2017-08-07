# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

include(hunter_fatal_error)

function(hunter_report_broken_package)
  if(HUNTER_IGNORE_BROKEN_PACKAGE_ERROR)
    return()
  endif()
  set(msg "")
  foreach(x ${ARGV})
    set(msg "${msg} ${x}")
  endforeach()
  hunter_fatal_error("Broken package: ${msg}" WIKI "error.broken.package")
endfunction()

# vim:set shiftwidth=2 tabstop=2 softtabstop=2 expandtab:
