# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

include(hunter_create_dependency_entry)
include(hunter_process_dependency_node)
include(hunter_test_string_not_empty)

# Get list of dependencies in format (see hunter_create_dependency_entry):
#   <package> <component> <sha1>
#   <package> <sha1>
# Splitted on several levels:
#   level-0: packages that don't depends on anything
#   level-1: packages that depends only on level-0
#   level-2: packages that depends only on level-0/level-1
#   ...
#   level-N: packages that depends only on level-0/level-1/.../level-(N-1)
# Packages of each level sorted alphabetically
function(hunter_get_dependency_list list_name)
  hunter_test_string_not_empty("${HUNTER_PACKAGE_NAME}")
  hunter_test_string_not_empty("${list_name}")
  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" has_component)

  # This is the result list
  # hunter_process_dependency_node will ignore anything in this list
  set(ready "")

  while(TRUE)
    # Get all dependencies. All packages that don't depend on anything will
    # be saved to 'free', others will be saved to 'depends'
    hunter_process_dependency_node(
        PACKAGE "${HUNTER_PACKAGE_NAME}"
        COMPONENT "${HUNTER_PACKAGE_COMPONENT}"
        READY "${ready}"
        DEPENDS depends
        FREE free
    )
    # Append next level (list already sorted)
    list(APPEND ready ${free})
    string(COMPARE EQUAL "${depends}" "" stop)
    if(stop)
      break()
    endif()
  endwhile()

  # Exclude yourself from this list
  hunter_create_dependency_entry(
      PACKAGE "${HUNTER_PACKAGE_NAME}"
      COMPONENT "${HUNTER_PACKAGE_COMPONENT}"
      RESULT this_item
  )

  list(LENGTH ready len)
  if(len EQUAL 0)
    hunter_internal_error("Unexpected")
  endif()

  if(len EQUAL 1)
    string(COMPARE EQUAL "${this_item}" "${ready}" is_good)
    if(NOT is_good)
      hunter_internal_error("Unexpected")
    endif()
    set("${list_name}" "" PARENT_SCOPE)
    return()
  endif()

  list(FIND ready "${this_item}" found)
  if(found EQUAL -1)
    hunter_internal_error("Unexpected")
  endif()

  list(REMOVE_ITEM ready "${this_item}")

  # Sanity check
  list(FIND ready "${this_item}" found)
  if(NOT found EQUAL -1)
    hunter_internal_error("Unexpected")
  endif()

  set("${list_name}" "${ready}" PARENT_SCOPE)
endfunction()
