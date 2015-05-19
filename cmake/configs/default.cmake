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

# NOTE: no names with spaces!

hunter_config(Android-Build-Tools VERSION 22.0.1)
hunter_config(Android-Google-APIs VERSION 22)
hunter_config(Android-Google-APIs-Intel-x86-Atom-System-Image VERSION 22)
hunter_config(Android-Google-Repository VERSION 17)
hunter_config(Android-Intel-x86-Atom-System-Image VERSION 22)
hunter_config(Android-SDK-Platform VERSION 22_r02)
hunter_config(Android-SDK-Platform-tools VERSION r22)
hunter_config(Android-SDK-Tools VERSION 24.2)
hunter_config(Android-Support-Repository VERSION 14)
hunter_config(BZip2 VERSION 1.0.6-p1)
hunter_config(Boost VERSION 1.57.0)
hunter_config(CLAPACK VERSION 3.2.1)
hunter_config(Clang VERSION 3.6.0)
hunter_config(ClangToolsExtra VERSION ${HUNTER_Clang_VERSION})
hunter_config(Comet VERSION 4.0.1)
hunter_config(CppNetlib VERSION 0.10.1-hunter-3)
hunter_config(CppNetlibUri VERSION 1.0.4-hunter)
hunter_config(CsvParserCPlusPlus VERSION 1.0.1)
hunter_config(Eigen VERSION 3.2.4)
hunter_config(Expat VERSION 2.1.0)
hunter_config(GPUImage VERSION 0.1.6-p5)
hunter_config(GSL VERSION 1.16)
hunter_config(GTest VERSION 1.7.0-hunter-10)
hunter_config(Igloo VERSION 1.1.1-hunter)
hunter_config(IntSizeof VERSION 1.0.0)
hunter_config(JsonSpirit VERSION 0.0.4-hunter)
hunter_config(LLVM VERSION ${HUNTER_Clang_VERSION})
hunter_config(LLVMCompilerRT VERSION ${HUNTER_Clang_VERSION})
hunter_config(Leathers VERSION 0.1.6)
hunter_config(Libcxx VERSION ${HUNTER_Clang_VERSION})
hunter_config(Libcxxabi VERSION ${HUNTER_Clang_VERSION})
hunter_config(Libssh2 VERSION 1.4.4-patch-2)
hunter_config(OpenCV VERSION 3.0.0-rc1-p0)
hunter_config(OpenSSL VERSION 1.0.2a)
hunter_config(PNG VERSION 1.6.16-p3)
hunter_config(RapidJSON VERSION 0.11-hunter)
hunter_config(Sober VERSION 0.1.1) # Relax warnings
hunter_config(Sources-for-Android-SDK VERSION 22)
hunter_config(Sugar VERSION 1.2.2)
hunter_config(TIFF VERSION 4.0.2-p3)
hunter_config(Washer VERSION 0.1.2)
hunter_config(WinSparkle VERSION 0.4.0)
hunter_config(ZLIB VERSION 1.2.8-p3)
hunter_config(ccv VERSION 0.7-p6)
hunter_config(cvmatio VERSION 1.0.12)
hunter_config(dlib VERSION 18.14-p1)
hunter_config(ios_sim VERSION 3.1.1)
hunter_config(ippicv VERSION 20141027)
hunter_config(wxWidgets VERSION 3.0.2)
