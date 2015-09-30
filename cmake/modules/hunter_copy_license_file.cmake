# Copyright (c) 2015, Aaditya Kalsi
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

function(hunter_copy_license_file srcdir dstfile)
  # find the license file to copy
  
  if(EXISTS "${srcdir}/LICENSE")
    file(COPY "${srcdir}/LICENSE" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/LICENSE.txt")
    file(COPY "${srcdir}/LICENSE.txt" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/COPYING")
    file(COPY "${srcdir}/COPYING" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/COPYING.txt")
    file(COPY "${srcdir}/COPYING.txt" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/license")
    file(COPY "${srcdir}/license" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/license.txt")
    file(COPY "${srcdir}/license.txt" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/copying")
    file(COPY "${srcdir}/copying" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/copying.txt")
    file(COPY "${srcdir}/copying.txt" ${dstfile})
    return()
  endif()

  if(EXISTS "${srcdir}/LICENSE_1_0.txt")
    file(COPY "${srcdir}/LICENSE_1_0.txt" ${dstfile})
    return()
  endif()

endfunction(hunter_copy_license_file)
