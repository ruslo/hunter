# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

include(CMakeParseArguments) # cmake_parse_arguments

include(hunter_internal_error)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)
include(hunter_user_error)

function(hunter_patch_unrelocatable_text_files)
  cmake_parse_arguments(x "" "FROM;TO;INSTALL_PREFIX" "" ${ARGV})
  # -> x_FROM
  # -> x_TO
  # -> x_INSTALL_PREFIX
  # -> x_UNPARSED_ARGUMENTS

  string(COMPARE NOTEQUAL "${x_UNPARSED_ARGUMENTS}" "" has_unparsed)

  if(has_unparsed)
    hunter_internal_error("Unparsed: ${hunter_UNPARSED_ARGUMENTS}")
  endif()

  hunter_assert_not_empty_string("${x_FROM}")
  hunter_assert_not_empty_string("${x_TO}")
  hunter_assert_not_empty_string("${x_INSTALL_PREFIX}")

  foreach(text_file ${HUNTER_PACKAGE_UNRELOCATABLE_TEXT_FILES})
    set(text_full_path "${x_INSTALL_PREFIX}/${text_file}")
    if(NOT EXISTS "${text_full_path}")
      hunter_user_error(
          "File not exists:"
          "  ${text_full_path}"
          "(check HUNTER_PACKAGE_UNRELOCATABLE_TEXT_FILES)"
      )
    endif()
    hunter_status_debug("Patching text file: ${text_full_path}")
    file(STRINGS "${text_full_path}" lines)

    set(output_content "")
    foreach(line ${lines})
      string(REPLACE "${x_FROM}" "${x_TO}" line "${line}")
      set(output_content "${output_content}\n${line}")
    endforeach()

    # if file is a link we should remove it first, otherwise we will
    # update original file too
    file(REMOVE "${text_full_path}")

    file(WRITE "${text_full_path}" "${output_content}\n")
  endforeach()
endfunction()
