# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

include("../../examples/common.cmake")
project(TestModuleHunterSleepBeforeDownload)

include(hunter_sleep_before_download)

foreach(x RANGE 4)
  message("Try #${x}")
  hunter_sleep_before_download("${x}")
endforeach()
