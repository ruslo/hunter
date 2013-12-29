# Cross-platform sleep
# http://public.kitware.com/Bug/print_bug_page.php?bug_id=14484

if(NOT DEFINED seconds)
  set(seconds 1)
endif()

set(CTEST_RUN_CURRENT_SCRIPT 0)

ctest_sleep(${seconds})
