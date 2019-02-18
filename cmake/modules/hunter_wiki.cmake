# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

# Do not move to master - build schemes use this module but they not use master
set(HUNTER_WIKI "https://docs.hunter.sh/en/latest/reference/errors")

function(hunter_wiki wiki_page)
  message("------------------------------ WIKI -------------------------------")
  message("    ${HUNTER_WIKI}/${wiki_page}.html")
  message("-------------------------------------------------------------------")
  message("")
  message(FATAL_ERROR "")
endfunction()
