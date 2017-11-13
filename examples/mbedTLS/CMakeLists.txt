cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mbedtls)

hunter_add_package(mbedtls)
find_library(
    mbedtls_release
    mbedtls
    PATHS ${MBEDTLS_ROOT}/lib
)

if (NOT mbedtls_release)
    message(FATAL_ERROR "mbedtls Release libraries not found.")
endif(NOT mbedtls_release)

find_library(
    mbedx509_release
    mbedx509
    PATHS ${MBEDTLS_ROOT}/lib
)

if (NOT mbedx509_release)
    message(FATAL_ERROR "mbedx509 Release libraries not found.")
endif(NOT mbedx509_release)

find_library(
    mbedcrypto_release
    mbedcrypto
    PATHS ${MBEDTLS_ROOT}/lib
)

if (NOT mbedcrypto_release)
    message(FATAL_ERROR "mbedcrypto Release libraries not found.")
endif(NOT mbedcrypto_release)

find_library(
    mbedtls_debug
    mbedtls${CMAKE_DEBUG_POSTFIX}
    PATHS ${MBEDTLS_ROOT}/lib
)

if (NOT mbedtls_debug)
    message(FATAL_ERROR "mbedtls Debug libraries not found.")
endif(NOT mbedtls_debug)

find_library(
    mbedx509_debug
    mbedx509${CMAKE_DEBUG_POSTFIX}
    PATHS ${MBEDTLS_ROOT}/lib
)

if (NOT mbedx509_debug)
    message(FATAL_ERROR "mbedx509 Debug libraries not found.")
endif(NOT mbedx509_debug)

find_library(
    mbedcrypto_debug
    mbedcrypto${CMAKE_DEBUG_POSTFIX}
    PATHS ${MBEDTLS_ROOT}/lib
)

if (NOT mbedcrypto_debug)
    message(FATAL_ERROR "mbedcrypto Debug libraries not found.")
endif(NOT mbedcrypto_debug)

set(mbedTLS_LIBRARIES debug ${mbedtls_debug} ${mbedx509_debug} ${mbedcrypto_debug}
                    optimized ${mbedtls_release} ${mbedx509_release} ${mbedcrypto_release})
message(STATUS ${mbedTLS_LIBRARIES})
