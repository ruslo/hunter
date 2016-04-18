include(hunter_internal_error)

# Figures out direct with project recipe
function(hunter_find_project_dir projectname output)
  if(NOT HUNTER_${projectname}_REPOSITORY)
    hunter_internal_error("No ${projectname} package defined")
  endif()
  set(directory "${HUNTER_${projectname}_REPOSITORY}/projects/${projectname}")
  if(NOT EXISTS "${directory}/hunter.cmake")
    hunter_internal_error(
        "Repository set for package, "
        "but ${directory}/hunter.cmake does not exist")
  endif()
  set(${output} "${directory}" PARENT_SCOPE)
endfunction()
