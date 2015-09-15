# Copyright (c) 2013-2015, Ruslan Baratov
# All rights reserved.

# Do not place header guards here

# Unset:
#   * ${PACKAGE_NAME}_ROOT (CMake variable)
#   * ${PACKAGE_NAME}_ROOT (CMake cache variable)
#   * ${PACKAGE_NAME}_ROOT (environment variable)

# Set CMake variables:
#   * HUNTER_${PACKAGE_NAME}_VERSION
#   * HUNTER_${PACKAGE_NAME}_CMAKE_ARGS (optionally)

# Usage:
#   hunter_config(Foo VERSION 1.0.0)
#   hunter_config(Boo VERSION 1.2.3z CMAKE_ARGS BOO_WITH_A=ON)

# Wiki:
#   * https://github.com/ruslo/hunter/wiki/dev.modules#hunter_config

include(hunter_config)
include(hunter_user_error)

# NOTE: no names with spaces!

hunter_config(Android-Apk VERSION 1.1.5)
hunter_config(Android-Build-Tools VERSION 22.0.1)
hunter_config(Android-Google-Repository VERSION 19)
hunter_config(Android-Modules VERSION 1.0.0)
hunter_config(Android-SDK VERSION 0.0.2)
hunter_config(Android-SDK-Platform-tools VERSION r22)
hunter_config(Android-SDK-Tools VERSION 24.3.3)
hunter_config(Android-Support-Repository VERSION 16)
hunter_config(Avahi VERSION 0.6.31)
hunter_config(BZip2 VERSION 1.0.6-p1)
hunter_config(Boost VERSION 1.58.0-p1)
hunter_config(CLAPACK VERSION 3.2.1)
hunter_config(Clang VERSION 3.6.2)
hunter_config(ClangToolsExtra VERSION ${HUNTER_Clang_VERSION})
hunter_config(Comet VERSION 4.0.1)
hunter_config(CppNetlib VERSION 0.10.1-hunter-3)
hunter_config(CppNetlibUri VERSION 1.0.4-hunter)
hunter_config(CsvParserCPlusPlus VERSION 1.0.1)
hunter_config(dbus VERSION 1.10.0-hunter-2)
hunter_config(Eigen VERSION 3.2.4-p0)
hunter_config(Expat VERSION 2.1.0)
hunter_config(GPUImage VERSION 0.1.6-p5)
hunter_config(GSL VERSION 1.16)
hunter_config(GTest VERSION 1.7.0-hunter-10)
hunter_config(Igloo VERSION 1.1.1-hunter)
hunter_config(intltool VERSION 0.51.0)
hunter_config(IntSizeof VERSION 1.0.0)
hunter_config(JsonSpirit VERSION 0.0.4-hunter)
hunter_config(LLVM VERSION ${HUNTER_Clang_VERSION})
hunter_config(LLVMCompilerRT VERSION ${HUNTER_Clang_VERSION})
hunter_config(Leathers VERSION 0.1.6)
hunter_config(Libcxx VERSION ${HUNTER_Clang_VERSION})
hunter_config(Libcxxabi VERSION ${HUNTER_Clang_VERSION})
hunter_config(libdaemon VERSION 0.14)
hunter_config(Libssh2 VERSION 1.4.4-patch-2)
hunter_config(OpenCV VERSION 3.0.0-p6)
hunter_config(OpenCV-Extra VERSION 3.0.0)
hunter_config(OpenSSL VERSION 1.0.2d)
hunter_config(PNG VERSION 1.6.16-p4)
hunter_config(Qt VERSION 5.5.0)
hunter_config(QtAndroidCMake VERSION 1.0.4)
hunter_config(RapidJSON VERSION 0.11-hunter)
hunter_config(SQLite3 VERSION autoconf-3080803) #R-Tree enabled
hunter_config(Sober VERSION 0.1.2)
hunter_config(Sugar VERSION 1.2.2)
hunter_config(TIFF VERSION 4.0.2-p3)
hunter_config(Washer VERSION 0.1.2)
hunter_config(WinSparkle VERSION 0.4.0)
hunter_config(ZLIB VERSION 1.2.8-p3)
hunter_config(ccv VERSION 0.7-p6)
hunter_config(cereal VERSION 1.1.2-p5)
hunter_config(cvmatio VERSION 1.0.26)
hunter_config(dlib VERSION 18.14-p1)
hunter_config(geos VERSION 3.4.2)
hunter_config(glog VERSION 0.3.4-p0)
hunter_config(hdf5 VERSION 1.8.15-p1)
hunter_config(ios_sim VERSION 3.1.1)
hunter_config(ippicv VERSION 20141027)
hunter_config(odb VERSION 2.4.0)
hunter_config(odb-compiler VERSION 2.4.0)
hunter_config(odb-sqlite VERSION 2.4.0)
hunter_config(rabbitmq-c VERSION 0.7.0-p1)
hunter_config(sparsehash VERSION 2.0.2)
hunter_config(spdlog VERSION 1.0.0-p0)
hunter_config(szip VERSION 2.1.0-p1)
hunter_config(wxWidgets VERSION 3.0.2)

if(ANDROID)
  string(COMPARE EQUAL "${ANDROID_NATIVE_API_LEVEL}" "" _is_empty)
  if(_is_empty)
    hunter_user_error("ANDROID_NATIVE_API_LEVEL is empty")
  endif()

  string(COMPARE EQUAL "${ANDROID_NATIVE_API_LEVEL}" "21" _is_api_21)
  string(COMPARE EQUAL "${ANDROID_NATIVE_API_LEVEL}" "19" _is_api_19)
  string(COMPARE EQUAL "${ANDROID_NATIVE_API_LEVEL}" "16" _is_api_16)

  if(_is_api_21)
    hunter_config(Android-Google-APIs VERSION 21)
    hunter_config(Android-Google-APIs-Intel-x86-Atom-System-Image VERSION 21)
    hunter_config(Android-Intel-x86-Atom-System-Image VERSION 21)
    hunter_config(Android-SDK-Platform VERSION 21_r02)
    hunter_config(Sources-for-Android-SDK VERSION 21)
  elseif(_is_api_19)
    hunter_config(Android-Google-APIs VERSION 19)
    hunter_config(Android-Intel-x86-Atom-System-Image VERSION 19)
    hunter_config(Android-SDK-Platform VERSION 19_r04)
    hunter_config(Sources-for-Android-SDK VERSION 19)

    # There is no package for API 19, use version 21
    # (simplify build of Android-SDK package)
    hunter_config(Android-Google-APIs-Intel-x86-Atom-System-Image VERSION 21)
  elseif(_is_api_16)
    hunter_config(Android-Google-APIs VERSION 16)
    hunter_config(Android-Intel-x86-Atom-System-Image VERSION 16)
    hunter_config(Android-SDK-Platform VERSION 16_r05)
    hunter_config(Sources-for-Android-SDK VERSION 16)

    # There is no package for API 16, use version 21
    # (simplify build of Android-SDK package)
    hunter_config(Android-Google-APIs-Intel-x86-Atom-System-Image VERSION 21)
  else()
    hunter_user_error(
        "Android API (ANDROID_NATIVE_API_LEVEL)"
        " Expected: `21`, `19`, `16`"
        " Got: `${ANDROID_NATIVE_API_LEVEL}`"
    )
  endif()
endif()
