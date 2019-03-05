# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

# Do not move to master - build schemes use this module but they not use master
set(HUNTER_ERROR_PAGE "https://docs.hunter.sh/en/latest/reference/errors")

function(hunter_error_page error_page)
  message("------------------------------ ERROR -----------------------------")
  message("    ${HUNTER_ERROR_PAGE}/${error_page}.html")
  message("------------------------------------------------------------------")
  message("")
  message(FATAL_ERROR "")
endfunction()
