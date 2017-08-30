
// This file generated automatically by `create-predefined-list.py` script.
// * https://github.com/ruslo/hunter

#define HUNTER_QUOTE(x) #x
#define HUNTER_STRING(x) HUNTER_QUOTE(x)
#define HUNTER_INFO(x) \
    "__HUNTER_MACRO_CHECK_BEGIN__" \
    "#define " #x " " HUNTER_STRING(x) \
    "__HUNTER_MACRO_CHECK_END__"

#include <exception> // Check std library version

#if defined(__ANDROID__)
# include <android/api-level.h> // Header with __ANDROID_API__
#endif

#if defined(_MSC_VER)
# include <SdkDdkVer.h> // Header with _WIN32_WINNT
#endif

#if defined(_ABI64)
# pragma message(HUNTER_INFO(_ABI64))
#endif

#if defined(_ABIO32)
# pragma message(HUNTER_INFO(_ABIO32))
#endif

#if defined(_AIX)
# pragma message(HUNTER_INFO(_AIX))
#endif

#if defined(_AIX3)
# pragma message(HUNTER_INFO(_AIX3))
#endif

#if defined(_AIX32)
# pragma message(HUNTER_INFO(_AIX32))
#endif

#if defined(_AIX41)
# pragma message(HUNTER_INFO(_AIX41))
#endif

#if defined(_AIX43)
# pragma message(HUNTER_INFO(_AIX43))
#endif

#if defined(_ARCH_601)
# pragma message(HUNTER_INFO(_ARCH_601))
#endif

#if defined(_ARCH_603)
# pragma message(HUNTER_INFO(_ARCH_603))
#endif

#if defined(_ARCH_PPC)
# pragma message(HUNTER_INFO(_ARCH_PPC))
#endif

#if defined(_ARCH_PWR)
# pragma message(HUNTER_INFO(_ARCH_PWR))
#endif

#if defined(_ARCH_PWR2)
# pragma message(HUNTER_INFO(_ARCH_PWR2))
#endif

#if defined(_ATL_VER)
# pragma message(HUNTER_INFO(_ATL_VER))
#endif

#if defined(_BIG_ENDIAN)
# pragma message(HUNTER_INFO(_BIG_ENDIAN))
#endif

#if defined(_BYTE_ORDER)
# pragma message(HUNTER_INFO(_BYTE_ORDER))
#endif

#if defined(_CHAR_UNSIGNED)
# pragma message(HUNTER_INFO(_CHAR_UNSIGNED))
#endif

#if defined(_COMPILER_VERSION)
# pragma message(HUNTER_INFO(_COMPILER_VERSION))
#endif

#if defined(_CONTROL_FLOW_GUARD)
# pragma message(HUNTER_INFO(_CONTROL_FLOW_GUARD))
#endif

#if defined(_CPPLIB_VER)
# pragma message(HUNTER_INFO(_CPPLIB_VER))
#endif

#if defined(_CPPRTTI)
# pragma message(HUNTER_INFO(_CPPRTTI))
#endif

#if defined(_CPPUNWIND)
# pragma message(HUNTER_INFO(_CPPUNWIND))
#endif

#if defined(_DLL)
# pragma message(HUNTER_INFO(_DLL))
#endif

#if defined(_GLIBCXX_USE_CXX11_ABI)
# pragma message(HUNTER_INFO(_GLIBCXX_USE_CXX11_ABI))
#endif

#if defined(_GNU_SOURCE)
# pragma message(HUNTER_INFO(_GNU_SOURCE))
#endif

#if defined(_IA64)
# pragma message(HUNTER_INFO(_IA64))
#endif

#if defined(_IBMR2)
# pragma message(HUNTER_INFO(_IBMR2))
#endif

#if defined(_INTEGRAL_MAX_BITS)
# pragma message(HUNTER_INFO(_INTEGRAL_MAX_BITS))
#endif

#if defined(_ISO_VOLATILE)
# pragma message(HUNTER_INFO(_ISO_VOLATILE))
#endif

#if defined(_KERNEL_MODE)
# pragma message(HUNTER_INFO(_KERNEL_MODE))
#endif

#if defined(_LIBCPP_HAS_NO_ASAN)
# pragma message(HUNTER_INFO(_LIBCPP_HAS_NO_ASAN))
#endif

#if defined(_LIBCPP_VERSION)
# pragma message(HUNTER_INFO(_LIBCPP_VERSION))
#endif

#if defined(_LITTLE_ENDIAN)
# pragma message(HUNTER_INFO(_LITTLE_ENDIAN))
#endif

#if defined(_LP64)
# pragma message(HUNTER_INFO(_LP64))
#endif

#if defined(_MANAGED)
# pragma message(HUNTER_INFO(_MANAGED))
#endif

#if defined(_MFC_VER)
# pragma message(HUNTER_INFO(_MFC_VER))
#endif

#if defined(_MIPSEB)
# pragma message(HUNTER_INFO(_MIPSEB))
#endif

#if defined(_MIPSEL)
# pragma message(HUNTER_INFO(_MIPSEL))
#endif

#if defined(_MIPS_ISA_MIPS1)
# pragma message(HUNTER_INFO(_MIPS_ISA_MIPS1))
#endif

#if defined(_MIPS_ISA_MIPS2)
# pragma message(HUNTER_INFO(_MIPS_ISA_MIPS2))
#endif

#if defined(_MIPS_ISA_MIPS3)
# pragma message(HUNTER_INFO(_MIPS_ISA_MIPS3))
#endif

#if defined(_MIPS_ISA_MIPS4)
# pragma message(HUNTER_INFO(_MIPS_ISA_MIPS4))
#endif

#if defined(_MRI)
# pragma message(HUNTER_INFO(_MRI))
#endif

#if defined(_MSC_BUILD)
# pragma message(HUNTER_INFO(_MSC_BUILD))
#endif

#if defined(_MSC_EXTENSIONS)
# pragma message(HUNTER_INFO(_MSC_EXTENSIONS))
#endif

#if defined(_MSC_FULL_VER)
# pragma message(HUNTER_INFO(_MSC_FULL_VER))
#endif

#if defined(_MSC_VER)
# pragma message(HUNTER_INFO(_MSC_VER))
#endif

#if defined(_MSVC_LANG)
# pragma message(HUNTER_INFO(_MSVC_LANG))
#endif

#if defined(_MT)
# pragma message(HUNTER_INFO(_MT))
#endif

#if defined(_M_ALPHA)
# pragma message(HUNTER_INFO(_M_ALPHA))
#endif

#if defined(_M_AMD64)
# pragma message(HUNTER_INFO(_M_AMD64))
#endif

#if defined(_M_ARM)
# pragma message(HUNTER_INFO(_M_ARM))
#endif

#if defined(_M_ARM64)
# pragma message(HUNTER_INFO(_M_ARM64))
#endif

#if defined(_M_ARM_ARMV7VE)
# pragma message(HUNTER_INFO(_M_ARM_ARMV7VE))
#endif

#if defined(_M_ARM_FP)
# pragma message(HUNTER_INFO(_M_ARM_FP))
#endif

#if defined(_M_CEE)
# pragma message(HUNTER_INFO(_M_CEE))
#endif

#if defined(_M_CEE_PURE)
# pragma message(HUNTER_INFO(_M_CEE_PURE))
#endif

#if defined(_M_CEE_SAFE)
# pragma message(HUNTER_INFO(_M_CEE_SAFE))
#endif

#if defined(_M_FP_EXCEPT)
# pragma message(HUNTER_INFO(_M_FP_EXCEPT))
#endif

#if defined(_M_FP_FAST)
# pragma message(HUNTER_INFO(_M_FP_FAST))
#endif

#if defined(_M_FP_PRECISE)
# pragma message(HUNTER_INFO(_M_FP_PRECISE))
#endif

#if defined(_M_FP_STRICT)
# pragma message(HUNTER_INFO(_M_FP_STRICT))
#endif

#if defined(_M_IA64)
# pragma message(HUNTER_INFO(_M_IA64))
#endif

#if defined(_M_IX86)
# pragma message(HUNTER_INFO(_M_IX86))
#endif

#if defined(_M_IX86_FP)
# pragma message(HUNTER_INFO(_M_IX86_FP))
#endif

#if defined(_M_PPC)
# pragma message(HUNTER_INFO(_M_PPC))
#endif

#if defined(_M_X64)
# pragma message(HUNTER_INFO(_M_X64))
#endif

#if defined(_NATIVE_WCHAR_T_DEFINED)
# pragma message(HUNTER_INFO(_NATIVE_WCHAR_T_DEFINED))
#endif

#if defined(_NTO_VERSION)
# pragma message(HUNTER_INFO(_NTO_VERSION))
#endif

#if defined(_OPENMP)
# pragma message(HUNTER_INFO(_OPENMP))
#endif

#if defined(_PACC_VER)
# pragma message(HUNTER_INFO(_PACC_VER))
#endif

#if defined(_PA_RISC1_0)
# pragma message(HUNTER_INFO(_PA_RISC1_0))
#endif

#if defined(_PA_RISC1_1)
# pragma message(HUNTER_INFO(_PA_RISC1_1))
#endif

#if defined(_PA_RISC2_0)
# pragma message(HUNTER_INFO(_PA_RISC2_0))
#endif

#if defined(_PDP_ENDIAN)
# pragma message(HUNTER_INFO(_PDP_ENDIAN))
#endif

#if defined(_POSIX_SOURCE)
# pragma message(HUNTER_INFO(_POSIX_SOURCE))
#endif

#if defined(_POWER)
# pragma message(HUNTER_INFO(_POWER))
#endif

#if defined(_PREFAST_)
# pragma message(HUNTER_INFO(_PREFAST_))
#endif

#if defined(_R3000)
# pragma message(HUNTER_INFO(_R3000))
#endif

#if defined(_R4000)
# pragma message(HUNTER_INFO(_R4000))
#endif

#if defined(_RWSTD_VER)
# pragma message(HUNTER_INFO(_RWSTD_VER))
#endif

#if defined(_SGI_COMPILER_VERSION)
# pragma message(HUNTER_INFO(_SGI_COMPILER_VERSION))
#endif

#if defined(_STDC_PREDEF_H)
# pragma message(HUNTER_INFO(_STDC_PREDEF_H))
#endif

#if defined(_STLPORT_MAJOR)
# pragma message(HUNTER_INFO(_STLPORT_MAJOR))
#endif

#if defined(_STLPORT_VERSION)
# pragma message(HUNTER_INFO(_STLPORT_VERSION))
#endif

#if defined(_SYSTYPE_BSD)
# pragma message(HUNTER_INFO(_SYSTYPE_BSD))
#endif

#if defined(_SYSTYPE_SVR4)
# pragma message(HUNTER_INFO(_SYSTYPE_SVR4))
#endif

#if defined(_VC_NODEFAULTLIB)
# pragma message(HUNTER_INFO(_VC_NODEFAULTLIB))
#endif

#if defined(_WCHAR_T_DEFINED)
# pragma message(HUNTER_INFO(_WCHAR_T_DEFINED))
#endif

#if defined(_WIN32)
# pragma message(HUNTER_INFO(_WIN32))
#endif

#if defined(_WIN32_WINNT)
# pragma message(HUNTER_INFO(_WIN32_WINNT))
#endif

#if defined(_WIN64)
# pragma message(HUNTER_INFO(_WIN64))
#endif

#if defined(_WINRT_DLL)
# pragma message(HUNTER_INFO(_WINRT_DLL))
#endif

#if defined(_Wp64)
# pragma message(HUNTER_INFO(_Wp64))
#endif

#if defined(_X86_)
# pragma message(HUNTER_INFO(_X86_))
#endif

#if defined(_XENON)
# pragma message(HUNTER_INFO(_XENON))
#endif

#if defined(_XOPEN_SOURCE)
# pragma message(HUNTER_INFO(_XOPEN_SOURCE))
#endif

#if defined(_YVALS)
# pragma message(HUNTER_INFO(_YVALS))
#endif

#if defined(__370__)
# pragma message(HUNTER_INFO(__370__))
#endif

#if defined(__AARCH64EB__)
# pragma message(HUNTER_INFO(__AARCH64EB__))
#endif

#if defined(__AARCH64EL__)
# pragma message(HUNTER_INFO(__AARCH64EL__))
#endif

#if defined(__AARCH64_SIMD__)
# pragma message(HUNTER_INFO(__AARCH64_SIMD__))
#endif

#if defined(__ACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__ACCUM_EPSILON__))
#endif

#if defined(__ACCUM_FBIT__)
# pragma message(HUNTER_INFO(__ACCUM_FBIT__))
#endif

#if defined(__ACCUM_IBIT__)
# pragma message(HUNTER_INFO(__ACCUM_IBIT__))
#endif

#if defined(__ACCUM_MAX__)
# pragma message(HUNTER_INFO(__ACCUM_MAX__))
#endif

#if defined(__ACCUM_MIN__)
# pragma message(HUNTER_INFO(__ACCUM_MIN__))
#endif

#if defined(__ALTIVEC__)
# pragma message(HUNTER_INFO(__ALTIVEC__))
#endif

#if defined(__ANDROID_API__)
# pragma message(HUNTER_INFO(__ANDROID_API__))
#endif

#if defined(__ANDROID__)
# pragma message(HUNTER_INFO(__ANDROID__))
#endif

#if defined(__APCS_32__)
# pragma message(HUNTER_INFO(__APCS_32__))
#endif

#if defined(__APPLE_CC__)
# pragma message(HUNTER_INFO(__APPLE_CC__))
#endif

#if defined(__APPLE__)
# pragma message(HUNTER_INFO(__APPLE__))
#endif

#if defined(__ARM64_ARCH_8__)
# pragma message(HUNTER_INFO(__ARM64_ARCH_8__))
#endif

#if defined(__ARMEB__)
# pragma message(HUNTER_INFO(__ARMEB__))
#endif

#if defined(__ARMEL__)
# pragma message(HUNTER_INFO(__ARMEL__))
#endif

#if defined(__ARM_32BIT_STATE)
# pragma message(HUNTER_INFO(__ARM_32BIT_STATE))
#endif

#if defined(__ARM_64BIT_STATE)
# pragma message(HUNTER_INFO(__ARM_64BIT_STATE))
#endif

#if defined(__ARM_ACLE)
# pragma message(HUNTER_INFO(__ARM_ACLE))
#endif

#if defined(__ARM_ALIGN_MAX_STACK_PWR)
# pragma message(HUNTER_INFO(__ARM_ALIGN_MAX_STACK_PWR))
#endif

#if defined(__ARM_ARCH)
# pragma message(HUNTER_INFO(__ARM_ARCH))
#endif

#if defined(__ARM_ARCH_7A__)
# pragma message(HUNTER_INFO(__ARM_ARCH_7A__))
#endif

#if defined(__ARM_ARCH_7S__)
# pragma message(HUNTER_INFO(__ARM_ARCH_7S__))
#endif

#if defined(__ARM_ARCH_EXT_IDIV__)
# pragma message(HUNTER_INFO(__ARM_ARCH_EXT_IDIV__))
#endif

#if defined(__ARM_ARCH_ISA_A64)
# pragma message(HUNTER_INFO(__ARM_ARCH_ISA_A64))
#endif

#if defined(__ARM_ARCH_ISA_ARM)
# pragma message(HUNTER_INFO(__ARM_ARCH_ISA_ARM))
#endif

#if defined(__ARM_ARCH_ISA_THUMB)
# pragma message(HUNTER_INFO(__ARM_ARCH_ISA_THUMB))
#endif

#if defined(__ARM_ARCH_PROFILE)
# pragma message(HUNTER_INFO(__ARM_ARCH_PROFILE))
#endif

#if defined(__ARM_ASM_SYNTAX_UNIFIED__)
# pragma message(HUNTER_INFO(__ARM_ASM_SYNTAX_UNIFIED__))
#endif

#if defined(__ARM_EABI__)
# pragma message(HUNTER_INFO(__ARM_EABI__))
#endif

#if defined(__ARM_FEATURE_CLZ)
# pragma message(HUNTER_INFO(__ARM_FEATURE_CLZ))
#endif

#if defined(__ARM_FEATURE_CRYPTO)
# pragma message(HUNTER_INFO(__ARM_FEATURE_CRYPTO))
#endif

#if defined(__ARM_FEATURE_DIV)
# pragma message(HUNTER_INFO(__ARM_FEATURE_DIV))
#endif

#if defined(__ARM_FEATURE_DSP)
# pragma message(HUNTER_INFO(__ARM_FEATURE_DSP))
#endif

#if defined(__ARM_FEATURE_FMA)
# pragma message(HUNTER_INFO(__ARM_FEATURE_FMA))
#endif

#if defined(__ARM_FEATURE_LDREX)
# pragma message(HUNTER_INFO(__ARM_FEATURE_LDREX))
#endif

#if defined(__ARM_FEATURE_QBIT)
# pragma message(HUNTER_INFO(__ARM_FEATURE_QBIT))
#endif

#if defined(__ARM_FEATURE_SAT)
# pragma message(HUNTER_INFO(__ARM_FEATURE_SAT))
#endif

#if defined(__ARM_FEATURE_SIMD32)
# pragma message(HUNTER_INFO(__ARM_FEATURE_SIMD32))
#endif

#if defined(__ARM_FEATURE_UNALIGNED)
# pragma message(HUNTER_INFO(__ARM_FEATURE_UNALIGNED))
#endif

#if defined(__ARM_FP)
# pragma message(HUNTER_INFO(__ARM_FP))
#endif

#if defined(__ARM_FP16_FORMAT_IEEE)
# pragma message(HUNTER_INFO(__ARM_FP16_FORMAT_IEEE))
#endif

#if defined(__ARM_NEON)
# pragma message(HUNTER_INFO(__ARM_NEON))
#endif

#if defined(__ARM_NEON_FP)
# pragma message(HUNTER_INFO(__ARM_NEON_FP))
#endif

#if defined(__ARM_NEON__)
# pragma message(HUNTER_INFO(__ARM_NEON__))
#endif

#if defined(__ARM_PCS_AAPCS64)
# pragma message(HUNTER_INFO(__ARM_PCS_AAPCS64))
#endif

#if defined(__ARM_PCS_VFP)
# pragma message(HUNTER_INFO(__ARM_PCS_VFP))
#endif

#if defined(__ARM_SIZEOF_MINIMAL_ENUM)
# pragma message(HUNTER_INFO(__ARM_SIZEOF_MINIMAL_ENUM))
#endif

#if defined(__ARM_SIZEOF_WCHAR_T)
# pragma message(HUNTER_INFO(__ARM_SIZEOF_WCHAR_T))
#endif

#if defined(__ARM_VFPV3__)
# pragma message(HUNTER_INFO(__ARM_VFPV3__))
#endif

#if defined(__ARM_VFPV4__)
# pragma message(HUNTER_INFO(__ARM_VFPV4__))
#endif

#if defined(__ATOMIC_ACQUIRE)
# pragma message(HUNTER_INFO(__ATOMIC_ACQUIRE))
#endif

#if defined(__ATOMIC_ACQ_REL)
# pragma message(HUNTER_INFO(__ATOMIC_ACQ_REL))
#endif

#if defined(__ATOMIC_CONSUME)
# pragma message(HUNTER_INFO(__ATOMIC_CONSUME))
#endif

#if defined(__ATOMIC_HLE_ACQUIRE)
# pragma message(HUNTER_INFO(__ATOMIC_HLE_ACQUIRE))
#endif

#if defined(__ATOMIC_HLE_RELEASE)
# pragma message(HUNTER_INFO(__ATOMIC_HLE_RELEASE))
#endif

#if defined(__ATOMIC_RELAXED)
# pragma message(HUNTER_INFO(__ATOMIC_RELAXED))
#endif

#if defined(__ATOMIC_RELEASE)
# pragma message(HUNTER_INFO(__ATOMIC_RELEASE))
#endif

#if defined(__ATOMIC_SEQ_CST)
# pragma message(HUNTER_INFO(__ATOMIC_SEQ_CST))
#endif

#if defined(__ATOM__)
# pragma message(HUNTER_INFO(__ATOM__))
#endif

#if defined(__AVX2__)
# pragma message(HUNTER_INFO(__AVX2__))
#endif

#if defined(__AVX__)
# pragma message(HUNTER_INFO(__AVX__))
#endif

#if defined(__BEOS__)
# pragma message(HUNTER_INFO(__BEOS__))
#endif

#if defined(__BFIN__)
# pragma message(HUNTER_INFO(__BFIN__))
#endif

#if defined(__BIGGEST_ALIGNMENT__)
# pragma message(HUNTER_INFO(__BIGGEST_ALIGNMENT__))
#endif

#if defined(__BIG_ENDIAN)
# pragma message(HUNTER_INFO(__BIG_ENDIAN))
#endif

#if defined(__BIG_ENDIAN__)
# pragma message(HUNTER_INFO(__BIG_ENDIAN__))
#endif

#if defined(__BLOCKS__)
# pragma message(HUNTER_INFO(__BLOCKS__))
#endif

#if defined(__BORLANDC__)
# pragma message(HUNTER_INFO(__BORLANDC__))
#endif

#if defined(__BYTE_ORDER)
# pragma message(HUNTER_INFO(__BYTE_ORDER))
#endif

#if defined(__BYTE_ORDER__)
# pragma message(HUNTER_INFO(__BYTE_ORDER__))
#endif

#if defined(__CHAR16_TYPE__)
# pragma message(HUNTER_INFO(__CHAR16_TYPE__))
#endif

#if defined(__CHAR32_TYPE__)
# pragma message(HUNTER_INFO(__CHAR32_TYPE__))
#endif

#if defined(__CHAR_BIT__)
# pragma message(HUNTER_INFO(__CHAR_BIT__))
#endif

#if defined(__CHAR_UNSIGNED__)
# pragma message(HUNTER_INFO(__CHAR_UNSIGNED__))
#endif

#if defined(__CLR_VER)
# pragma message(HUNTER_INFO(__CLR_VER))
#endif

#if defined(__CODEGEARC__)
# pragma message(HUNTER_INFO(__CODEGEARC__))
#endif

#if defined(__COMO_VERSION__)
# pragma message(HUNTER_INFO(__COMO_VERSION__))
#endif

#if defined(__COMO__)
# pragma message(HUNTER_INFO(__COMO__))
#endif

#if defined(__COMPILER_VER__)
# pragma message(HUNTER_INFO(__COMPILER_VER__))
#endif

#if defined(__CONO_VERSION__)
# pragma message(HUNTER_INFO(__CONO_VERSION__))
#endif

#if defined(__CONSTANT_CFSTRINGS__)
# pragma message(HUNTER_INFO(__CONSTANT_CFSTRINGS__))
#endif

#if defined(__COUNTER__)
# pragma message(HUNTER_INFO(__COUNTER__))
#endif

#if defined(__CRTL_VER)
# pragma message(HUNTER_INFO(__CRTL_VER))
#endif

#if defined(__CWCC__)
# pragma message(HUNTER_INFO(__CWCC__))
#endif

#if defined(__CYGWIN__)
# pragma message(HUNTER_INFO(__CYGWIN__))
#endif

#if defined(__DA_FBIT__)
# pragma message(HUNTER_INFO(__DA_FBIT__))
#endif

#if defined(__DA_IBIT__)
# pragma message(HUNTER_INFO(__DA_IBIT__))
#endif

#if defined(__DBL_DECIMAL_DIG__)
# pragma message(HUNTER_INFO(__DBL_DECIMAL_DIG__))
#endif

#if defined(__DBL_DENORM_MIN__)
# pragma message(HUNTER_INFO(__DBL_DENORM_MIN__))
#endif

#if defined(__DBL_DIG__)
# pragma message(HUNTER_INFO(__DBL_DIG__))
#endif

#if defined(__DBL_EPSILON__)
# pragma message(HUNTER_INFO(__DBL_EPSILON__))
#endif

#if defined(__DBL_HAS_DENORM__)
# pragma message(HUNTER_INFO(__DBL_HAS_DENORM__))
#endif

#if defined(__DBL_HAS_INFINITY__)
# pragma message(HUNTER_INFO(__DBL_HAS_INFINITY__))
#endif

#if defined(__DBL_HAS_QUIET_NAN__)
# pragma message(HUNTER_INFO(__DBL_HAS_QUIET_NAN__))
#endif

#if defined(__DBL_MANT_DIG__)
# pragma message(HUNTER_INFO(__DBL_MANT_DIG__))
#endif

#if defined(__DBL_MAX_10_EXP__)
# pragma message(HUNTER_INFO(__DBL_MAX_10_EXP__))
#endif

#if defined(__DBL_MAX_EXP__)
# pragma message(HUNTER_INFO(__DBL_MAX_EXP__))
#endif

#if defined(__DBL_MAX__)
# pragma message(HUNTER_INFO(__DBL_MAX__))
#endif

#if defined(__DBL_MIN_10_EXP__)
# pragma message(HUNTER_INFO(__DBL_MIN_10_EXP__))
#endif

#if defined(__DBL_MIN_EXP__)
# pragma message(HUNTER_INFO(__DBL_MIN_EXP__))
#endif

#if defined(__DBL_MIN__)
# pragma message(HUNTER_INFO(__DBL_MIN__))
#endif

#if defined(__DCC__)
# pragma message(HUNTER_INFO(__DCC__))
#endif

#if defined(__DEC128_EPSILON__)
# pragma message(HUNTER_INFO(__DEC128_EPSILON__))
#endif

#if defined(__DEC128_MANT_DIG__)
# pragma message(HUNTER_INFO(__DEC128_MANT_DIG__))
#endif

#if defined(__DEC128_MAX_EXP__)
# pragma message(HUNTER_INFO(__DEC128_MAX_EXP__))
#endif

#if defined(__DEC128_MAX__)
# pragma message(HUNTER_INFO(__DEC128_MAX__))
#endif

#if defined(__DEC128_MIN_EXP__)
# pragma message(HUNTER_INFO(__DEC128_MIN_EXP__))
#endif

#if defined(__DEC128_MIN__)
# pragma message(HUNTER_INFO(__DEC128_MIN__))
#endif

#if defined(__DEC128_SUBNORMAL_MIN__)
# pragma message(HUNTER_INFO(__DEC128_SUBNORMAL_MIN__))
#endif

#if defined(__DEC32_EPSILON__)
# pragma message(HUNTER_INFO(__DEC32_EPSILON__))
#endif

#if defined(__DEC32_MANT_DIG__)
# pragma message(HUNTER_INFO(__DEC32_MANT_DIG__))
#endif

#if defined(__DEC32_MAX_EXP__)
# pragma message(HUNTER_INFO(__DEC32_MAX_EXP__))
#endif

#if defined(__DEC32_MAX__)
# pragma message(HUNTER_INFO(__DEC32_MAX__))
#endif

#if defined(__DEC32_MIN_EXP__)
# pragma message(HUNTER_INFO(__DEC32_MIN_EXP__))
#endif

#if defined(__DEC32_MIN__)
# pragma message(HUNTER_INFO(__DEC32_MIN__))
#endif

#if defined(__DEC32_SUBNORMAL_MIN__)
# pragma message(HUNTER_INFO(__DEC32_SUBNORMAL_MIN__))
#endif

#if defined(__DEC64_EPSILON__)
# pragma message(HUNTER_INFO(__DEC64_EPSILON__))
#endif

#if defined(__DEC64_MANT_DIG__)
# pragma message(HUNTER_INFO(__DEC64_MANT_DIG__))
#endif

#if defined(__DEC64_MAX_EXP__)
# pragma message(HUNTER_INFO(__DEC64_MAX_EXP__))
#endif

#if defined(__DEC64_MAX__)
# pragma message(HUNTER_INFO(__DEC64_MAX__))
#endif

#if defined(__DEC64_MIN_EXP__)
# pragma message(HUNTER_INFO(__DEC64_MIN_EXP__))
#endif

#if defined(__DEC64_MIN__)
# pragma message(HUNTER_INFO(__DEC64_MIN__))
#endif

#if defined(__DEC64_SUBNORMAL_MIN__)
# pragma message(HUNTER_INFO(__DEC64_SUBNORMAL_MIN__))
#endif

#if defined(__DECC)
# pragma message(HUNTER_INFO(__DECC))
#endif

#if defined(__DECCXX)
# pragma message(HUNTER_INFO(__DECCXX))
#endif

#if defined(__DECCXX_VER)
# pragma message(HUNTER_INFO(__DECCXX_VER))
#endif

#if defined(__DECC_VER)
# pragma message(HUNTER_INFO(__DECC_VER))
#endif

#if defined(__DECIMAL_BID_FORMAT__)
# pragma message(HUNTER_INFO(__DECIMAL_BID_FORMAT__))
#endif

#if defined(__DECIMAL_DIG__)
# pragma message(HUNTER_INFO(__DECIMAL_DIG__))
#endif

#if defined(__DEC_EVAL_METHOD__)
# pragma message(HUNTER_INFO(__DEC_EVAL_METHOD__))
#endif

#if defined(__DEPRECATED)
# pragma message(HUNTER_INFO(__DEPRECATED))
#endif

#if defined(__DMC__)
# pragma message(HUNTER_INFO(__DMC__))
#endif

#if defined(__DQ_FBIT__)
# pragma message(HUNTER_INFO(__DQ_FBIT__))
#endif

#if defined(__DQ_IBIT__)
# pragma message(HUNTER_INFO(__DQ_IBIT__))
#endif

#if defined(__DYNAMIC__)
# pragma message(HUNTER_INFO(__DYNAMIC__))
#endif

#if defined(__DragonFly__)
# pragma message(HUNTER_INFO(__DragonFly__))
#endif

#if defined(__ECC)
# pragma message(HUNTER_INFO(__ECC))
#endif

#if defined(__EDG__)
# pragma message(HUNTER_INFO(__EDG__))
#endif

#if defined(__ELF__)
# pragma message(HUNTER_INFO(__ELF__))
#endif

#if defined(__ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__)
# pragma message(HUNTER_INFO(__ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__))
#endif

#if defined(__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__)
# pragma message(HUNTER_INFO(__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__))
#endif

#if defined(__EXCEPTIONS)
# pragma message(HUNTER_INFO(__EXCEPTIONS))
#endif

#if defined(__FINITE_MATH_ONLY__)
# pragma message(HUNTER_INFO(__FINITE_MATH_ONLY__))
#endif

#if defined(__FLOAT_WORD_ORDER__)
# pragma message(HUNTER_INFO(__FLOAT_WORD_ORDER__))
#endif

#if defined(__FLT_DECIMAL_DIG__)
# pragma message(HUNTER_INFO(__FLT_DECIMAL_DIG__))
#endif

#if defined(__FLT_DENORM_MIN__)
# pragma message(HUNTER_INFO(__FLT_DENORM_MIN__))
#endif

#if defined(__FLT_DIG__)
# pragma message(HUNTER_INFO(__FLT_DIG__))
#endif

#if defined(__FLT_EPSILON__)
# pragma message(HUNTER_INFO(__FLT_EPSILON__))
#endif

#if defined(__FLT_EVAL_METHOD__)
# pragma message(HUNTER_INFO(__FLT_EVAL_METHOD__))
#endif

#if defined(__FLT_HAS_DENORM__)
# pragma message(HUNTER_INFO(__FLT_HAS_DENORM__))
#endif

#if defined(__FLT_HAS_INFINITY__)
# pragma message(HUNTER_INFO(__FLT_HAS_INFINITY__))
#endif

#if defined(__FLT_HAS_QUIET_NAN__)
# pragma message(HUNTER_INFO(__FLT_HAS_QUIET_NAN__))
#endif

#if defined(__FLT_MANT_DIG__)
# pragma message(HUNTER_INFO(__FLT_MANT_DIG__))
#endif

#if defined(__FLT_MAX_10_EXP__)
# pragma message(HUNTER_INFO(__FLT_MAX_10_EXP__))
#endif

#if defined(__FLT_MAX_EXP__)
# pragma message(HUNTER_INFO(__FLT_MAX_EXP__))
#endif

#if defined(__FLT_MAX__)
# pragma message(HUNTER_INFO(__FLT_MAX__))
#endif

#if defined(__FLT_MIN_10_EXP__)
# pragma message(HUNTER_INFO(__FLT_MIN_10_EXP__))
#endif

#if defined(__FLT_MIN_EXP__)
# pragma message(HUNTER_INFO(__FLT_MIN_EXP__))
#endif

#if defined(__FLT_MIN__)
# pragma message(HUNTER_INFO(__FLT_MIN__))
#endif

#if defined(__FLT_RADIX__)
# pragma message(HUNTER_INFO(__FLT_RADIX__))
#endif

#if defined(__FMA4__)
# pragma message(HUNTER_INFO(__FMA4__))
#endif

#if defined(__FMA__)
# pragma message(HUNTER_INFO(__FMA__))
#endif

#if defined(__FRACT_EPSILON__)
# pragma message(HUNTER_INFO(__FRACT_EPSILON__))
#endif

#if defined(__FRACT_FBIT__)
# pragma message(HUNTER_INFO(__FRACT_FBIT__))
#endif

#if defined(__FRACT_IBIT__)
# pragma message(HUNTER_INFO(__FRACT_IBIT__))
#endif

#if defined(__FRACT_MAX__)
# pragma message(HUNTER_INFO(__FRACT_MAX__))
#endif

#if defined(__FRACT_MIN__)
# pragma message(HUNTER_INFO(__FRACT_MIN__))
#endif

#if defined(__FUNCDNAME__)
# pragma message(HUNTER_INFO(__FUNCDNAME__))
#endif

#if defined(__FUNCSIG__)
# pragma message(HUNTER_INFO(__FUNCSIG__))
#endif

#if defined(__FXSR__)
# pragma message(HUNTER_INFO(__FXSR__))
#endif

#if defined(__FreeBSD__)
# pragma message(HUNTER_INFO(__FreeBSD__))
#endif

#if defined(__FreeBSD_version)
# pragma message(HUNTER_INFO(__FreeBSD_version))
#endif

#if defined(__GCCXML__)
# pragma message(HUNTER_INFO(__GCCXML__))
#endif

#if defined(__GCC_ASM_FLAG_OUTPUTS__)
# pragma message(HUNTER_INFO(__GCC_ASM_FLAG_OUTPUTS__))
#endif

#if defined(__GCC_ATOMIC_BOOL_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_BOOL_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_CHAR16_T_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_CHAR16_T_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_CHAR32_T_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_CHAR32_T_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_CHAR_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_CHAR_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_INT_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_INT_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_LLONG_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_LLONG_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_LONG_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_LONG_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_POINTER_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_POINTER_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_SHORT_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_SHORT_LOCK_FREE))
#endif

#if defined(__GCC_ATOMIC_TEST_AND_SET_TRUEVAL)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_TEST_AND_SET_TRUEVAL))
#endif

#if defined(__GCC_ATOMIC_WCHAR_T_LOCK_FREE)
# pragma message(HUNTER_INFO(__GCC_ATOMIC_WCHAR_T_LOCK_FREE))
#endif

#if defined(__GCC_HAVE_DWARF2_CFI_ASM)
# pragma message(HUNTER_INFO(__GCC_HAVE_DWARF2_CFI_ASM))
#endif

#if defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1)
# pragma message(HUNTER_INFO(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1))
#endif

#if defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_16)
# pragma message(HUNTER_INFO(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_16))
#endif

#if defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2)
# pragma message(HUNTER_INFO(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2))
#endif

#if defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4)
# pragma message(HUNTER_INFO(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4))
#endif

#if defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8)
# pragma message(HUNTER_INFO(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8))
#endif

#if defined(__GCC_IEC_559)
# pragma message(HUNTER_INFO(__GCC_IEC_559))
#endif

#if defined(__GCC_IEC_559_COMPLEX)
# pragma message(HUNTER_INFO(__GCC_IEC_559_COMPLEX))
#endif

#if defined(__GHS_VERSION_NUMBER__)
# pragma message(HUNTER_INFO(__GHS_VERSION_NUMBER__))
#endif

#if defined(__GLIBCPP__)
# pragma message(HUNTER_INFO(__GLIBCPP__))
#endif

#if defined(__GLIBCXX_BITSIZE_INT_N_0)
# pragma message(HUNTER_INFO(__GLIBCXX_BITSIZE_INT_N_0))
#endif

#if defined(__GLIBCXX_TYPE_INT_N_0)
# pragma message(HUNTER_INFO(__GLIBCXX_TYPE_INT_N_0))
#endif

#if defined(__GLIBCXX__)
# pragma message(HUNTER_INFO(__GLIBCXX__))
#endif

#if defined(__GLIBC__)
# pragma message(HUNTER_INFO(__GLIBC__))
#endif

#if defined(__GNUC_GNU_INLINE__)
# pragma message(HUNTER_INFO(__GNUC_GNU_INLINE__))
#endif

#if defined(__GNUC_LIBSTD_MINOR__)
# pragma message(HUNTER_INFO(__GNUC_LIBSTD_MINOR__))
#endif

#if defined(__GNUC_LIBSTD__)
# pragma message(HUNTER_INFO(__GNUC_LIBSTD__))
#endif

#if defined(__GNUC_MINOR__)
# pragma message(HUNTER_INFO(__GNUC_MINOR__))
#endif

#if defined(__GNUC_PATCHLEVEL__)
# pragma message(HUNTER_INFO(__GNUC_PATCHLEVEL__))
#endif

#if defined(__GNUC_STDC_INLINE__)
# pragma message(HUNTER_INFO(__GNUC_STDC_INLINE__))
#endif

#if defined(__GNUC__)
# pragma message(HUNTER_INFO(__GNUC__))
#endif

#if defined(__GNUG__)
# pragma message(HUNTER_INFO(__GNUG__))
#endif

#if defined(__GNU_LIBRARY__)
# pragma message(HUNTER_INFO(__GNU_LIBRARY__))
#endif

#if defined(__GXX_ABI_VERSION)
# pragma message(HUNTER_INFO(__GXX_ABI_VERSION))
#endif

#if defined(__GXX_EXPERIMENTAL_CXX0X__)
# pragma message(HUNTER_INFO(__GXX_EXPERIMENTAL_CXX0X__))
#endif

#if defined(__GXX_RTTI)
# pragma message(HUNTER_INFO(__GXX_RTTI))
#endif

#if defined(__GXX_TYPEINFO_EQUALITY_INLINE)
# pragma message(HUNTER_INFO(__GXX_TYPEINFO_EQUALITY_INLINE))
#endif

#if defined(__GXX_WEAK__)
# pragma message(HUNTER_INFO(__GXX_WEAK__))
#endif

#if defined(__HAIKU__)
# pragma message(HUNTER_INFO(__HAIKU__))
#endif

#if defined(__HA_FBIT__)
# pragma message(HUNTER_INFO(__HA_FBIT__))
#endif

#if defined(__HA_IBIT__)
# pragma message(HUNTER_INFO(__HA_IBIT__))
#endif

#if defined(__HIGHC__)
# pragma message(HUNTER_INFO(__HIGHC__))
#endif

#if defined(__HPPA11__)
# pragma message(HUNTER_INFO(__HPPA11__))
#endif

#if defined(__HPPA20__)
# pragma message(HUNTER_INFO(__HPPA20__))
#endif

#if defined(__HPPA__)
# pragma message(HUNTER_INFO(__HPPA__))
#endif

#if defined(__HP_aCC)
# pragma message(HUNTER_INFO(__HP_aCC))
#endif

#if defined(__HQ_FBIT__)
# pragma message(HUNTER_INFO(__HQ_FBIT__))
#endif

#if defined(__HQ_IBIT__)
# pragma message(HUNTER_INFO(__HQ_IBIT__))
#endif

#if defined(__I86__)
# pragma message(HUNTER_INFO(__I86__))
#endif

#if defined(__IA64__)
# pragma message(HUNTER_INFO(__IA64__))
#endif

#if defined(__IAR_SYSTEMS_ICC__)
# pragma message(HUNTER_INFO(__IAR_SYSTEMS_ICC__))
#endif

#if defined(__IBMCPP__)
# pragma message(HUNTER_INFO(__IBMCPP__))
#endif

#if defined(__ICC)
# pragma message(HUNTER_INFO(__ICC))
#endif

#if defined(__ICL)
# pragma message(HUNTER_INFO(__ICL))
#endif

#if defined(__INT16_C)
# pragma message(HUNTER_INFO(__INT16_C))
#endif

#if defined(__INT16_MAX__)
# pragma message(HUNTER_INFO(__INT16_MAX__))
#endif

#if defined(__INT16_TYPE__)
# pragma message(HUNTER_INFO(__INT16_TYPE__))
#endif

#if defined(__INT32_C)
# pragma message(HUNTER_INFO(__INT32_C))
#endif

#if defined(__INT32_MAX__)
# pragma message(HUNTER_INFO(__INT32_MAX__))
#endif

#if defined(__INT32_TYPE__)
# pragma message(HUNTER_INFO(__INT32_TYPE__))
#endif

#if defined(__INT64_C)
# pragma message(HUNTER_INFO(__INT64_C))
#endif

#if defined(__INT64_C_SUFFIX__)
# pragma message(HUNTER_INFO(__INT64_C_SUFFIX__))
#endif

#if defined(__INT64_MAX__)
# pragma message(HUNTER_INFO(__INT64_MAX__))
#endif

#if defined(__INT64_TYPE__)
# pragma message(HUNTER_INFO(__INT64_TYPE__))
#endif

#if defined(__INT8_C)
# pragma message(HUNTER_INFO(__INT8_C))
#endif

#if defined(__INT8_MAX__)
# pragma message(HUNTER_INFO(__INT8_MAX__))
#endif

#if defined(__INT8_TYPE__)
# pragma message(HUNTER_INFO(__INT8_TYPE__))
#endif

#if defined(__INTEL_COMPILER)
# pragma message(HUNTER_INFO(__INTEL_COMPILER))
#endif

#if defined(__INTEL__)
# pragma message(HUNTER_INFO(__INTEL__))
#endif

#if defined(__INTMAX_C)
# pragma message(HUNTER_INFO(__INTMAX_C))
#endif

#if defined(__INTMAX_MAX__)
# pragma message(HUNTER_INFO(__INTMAX_MAX__))
#endif

#if defined(__INTMAX_TYPE__)
# pragma message(HUNTER_INFO(__INTMAX_TYPE__))
#endif

#if defined(__INTMAX_WIDTH__)
# pragma message(HUNTER_INFO(__INTMAX_WIDTH__))
#endif

#if defined(__INTPTR_MAX__)
# pragma message(HUNTER_INFO(__INTPTR_MAX__))
#endif

#if defined(__INTPTR_TYPE__)
# pragma message(HUNTER_INFO(__INTPTR_TYPE__))
#endif

#if defined(__INTPTR_WIDTH__)
# pragma message(HUNTER_INFO(__INTPTR_WIDTH__))
#endif

#if defined(__INT_FAST16_MAX__)
# pragma message(HUNTER_INFO(__INT_FAST16_MAX__))
#endif

#if defined(__INT_FAST16_TYPE__)
# pragma message(HUNTER_INFO(__INT_FAST16_TYPE__))
#endif

#if defined(__INT_FAST32_MAX__)
# pragma message(HUNTER_INFO(__INT_FAST32_MAX__))
#endif

#if defined(__INT_FAST32_TYPE__)
# pragma message(HUNTER_INFO(__INT_FAST32_TYPE__))
#endif

#if defined(__INT_FAST64_MAX__)
# pragma message(HUNTER_INFO(__INT_FAST64_MAX__))
#endif

#if defined(__INT_FAST64_TYPE__)
# pragma message(HUNTER_INFO(__INT_FAST64_TYPE__))
#endif

#if defined(__INT_FAST8_MAX__)
# pragma message(HUNTER_INFO(__INT_FAST8_MAX__))
#endif

#if defined(__INT_FAST8_TYPE__)
# pragma message(HUNTER_INFO(__INT_FAST8_TYPE__))
#endif

#if defined(__INT_LEAST16_MAX__)
# pragma message(HUNTER_INFO(__INT_LEAST16_MAX__))
#endif

#if defined(__INT_LEAST16_TYPE__)
# pragma message(HUNTER_INFO(__INT_LEAST16_TYPE__))
#endif

#if defined(__INT_LEAST32_MAX__)
# pragma message(HUNTER_INFO(__INT_LEAST32_MAX__))
#endif

#if defined(__INT_LEAST32_TYPE__)
# pragma message(HUNTER_INFO(__INT_LEAST32_TYPE__))
#endif

#if defined(__INT_LEAST64_MAX__)
# pragma message(HUNTER_INFO(__INT_LEAST64_MAX__))
#endif

#if defined(__INT_LEAST64_TYPE__)
# pragma message(HUNTER_INFO(__INT_LEAST64_TYPE__))
#endif

#if defined(__INT_LEAST8_MAX__)
# pragma message(HUNTER_INFO(__INT_LEAST8_MAX__))
#endif

#if defined(__INT_LEAST8_TYPE__)
# pragma message(HUNTER_INFO(__INT_LEAST8_TYPE__))
#endif

#if defined(__INT_MAX__)
# pragma message(HUNTER_INFO(__INT_MAX__))
#endif

#if defined(__KCC)
# pragma message(HUNTER_INFO(__KCC))
#endif

#if defined(__LACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__LACCUM_EPSILON__))
#endif

#if defined(__LACCUM_FBIT__)
# pragma message(HUNTER_INFO(__LACCUM_FBIT__))
#endif

#if defined(__LACCUM_IBIT__)
# pragma message(HUNTER_INFO(__LACCUM_IBIT__))
#endif

#if defined(__LACCUM_MAX__)
# pragma message(HUNTER_INFO(__LACCUM_MAX__))
#endif

#if defined(__LACCUM_MIN__)
# pragma message(HUNTER_INFO(__LACCUM_MIN__))
#endif

#if defined(__LDBL_DENORM_MIN__)
# pragma message(HUNTER_INFO(__LDBL_DENORM_MIN__))
#endif

#if defined(__LDBL_DIG__)
# pragma message(HUNTER_INFO(__LDBL_DIG__))
#endif

#if defined(__LDBL_EPSILON__)
# pragma message(HUNTER_INFO(__LDBL_EPSILON__))
#endif

#if defined(__LDBL_HAS_DENORM__)
# pragma message(HUNTER_INFO(__LDBL_HAS_DENORM__))
#endif

#if defined(__LDBL_HAS_INFINITY__)
# pragma message(HUNTER_INFO(__LDBL_HAS_INFINITY__))
#endif

#if defined(__LDBL_HAS_QUIET_NAN__)
# pragma message(HUNTER_INFO(__LDBL_HAS_QUIET_NAN__))
#endif

#if defined(__LDBL_MANT_DIG__)
# pragma message(HUNTER_INFO(__LDBL_MANT_DIG__))
#endif

#if defined(__LDBL_MAX_10_EXP__)
# pragma message(HUNTER_INFO(__LDBL_MAX_10_EXP__))
#endif

#if defined(__LDBL_MAX_EXP__)
# pragma message(HUNTER_INFO(__LDBL_MAX_EXP__))
#endif

#if defined(__LDBL_MAX__)
# pragma message(HUNTER_INFO(__LDBL_MAX__))
#endif

#if defined(__LDBL_MIN_10_EXP__)
# pragma message(HUNTER_INFO(__LDBL_MIN_10_EXP__))
#endif

#if defined(__LDBL_MIN_EXP__)
# pragma message(HUNTER_INFO(__LDBL_MIN_EXP__))
#endif

#if defined(__LDBL_MIN__)
# pragma message(HUNTER_INFO(__LDBL_MIN__))
#endif

#if defined(__LFRACT_EPSILON__)
# pragma message(HUNTER_INFO(__LFRACT_EPSILON__))
#endif

#if defined(__LFRACT_FBIT__)
# pragma message(HUNTER_INFO(__LFRACT_FBIT__))
#endif

#if defined(__LFRACT_IBIT__)
# pragma message(HUNTER_INFO(__LFRACT_IBIT__))
#endif

#if defined(__LFRACT_MAX__)
# pragma message(HUNTER_INFO(__LFRACT_MAX__))
#endif

#if defined(__LFRACT_MIN__)
# pragma message(HUNTER_INFO(__LFRACT_MIN__))
#endif

#if defined(__LIBCOMO__)
# pragma message(HUNTER_INFO(__LIBCOMO__))
#endif

#if defined(__LIBREL__)
# pragma message(HUNTER_INFO(__LIBREL__))
#endif

#if defined(__LITTLE_ENDIAN)
# pragma message(HUNTER_INFO(__LITTLE_ENDIAN))
#endif

#if defined(__LITTLE_ENDIAN__)
# pragma message(HUNTER_INFO(__LITTLE_ENDIAN__))
#endif

#if defined(__LLACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__LLACCUM_EPSILON__))
#endif

#if defined(__LLACCUM_FBIT__)
# pragma message(HUNTER_INFO(__LLACCUM_FBIT__))
#endif

#if defined(__LLACCUM_IBIT__)
# pragma message(HUNTER_INFO(__LLACCUM_IBIT__))
#endif

#if defined(__LLACCUM_MAX__)
# pragma message(HUNTER_INFO(__LLACCUM_MAX__))
#endif

#if defined(__LLACCUM_MIN__)
# pragma message(HUNTER_INFO(__LLACCUM_MIN__))
#endif

#if defined(__LLFRACT_EPSILON__)
# pragma message(HUNTER_INFO(__LLFRACT_EPSILON__))
#endif

#if defined(__LLFRACT_FBIT__)
# pragma message(HUNTER_INFO(__LLFRACT_FBIT__))
#endif

#if defined(__LLFRACT_IBIT__)
# pragma message(HUNTER_INFO(__LLFRACT_IBIT__))
#endif

#if defined(__LLFRACT_MAX__)
# pragma message(HUNTER_INFO(__LLFRACT_MAX__))
#endif

#if defined(__LLFRACT_MIN__)
# pragma message(HUNTER_INFO(__LLFRACT_MIN__))
#endif

#if defined(__LONG_LONG_MAX__)
# pragma message(HUNTER_INFO(__LONG_LONG_MAX__))
#endif

#if defined(__LONG_MAX__)
# pragma message(HUNTER_INFO(__LONG_MAX__))
#endif

#if defined(__LP64__)
# pragma message(HUNTER_INFO(__LP64__))
#endif

#if defined(__MACH__)
# pragma message(HUNTER_INFO(__MACH__))
#endif

#if defined(__MIC__)
# pragma message(HUNTER_INFO(__MIC__))
#endif

#if defined(__MINGW32_VERSION_MAJOR)
# pragma message(HUNTER_INFO(__MINGW32_VERSION_MAJOR))
#endif

#if defined(__MINGW32_VERSION_MINOR)
# pragma message(HUNTER_INFO(__MINGW32_VERSION_MINOR))
#endif

#if defined(__MINGW32__)
# pragma message(HUNTER_INFO(__MINGW32__))
#endif

#if defined(__MINGW64_VERSION_MAJOR)
# pragma message(HUNTER_INFO(__MINGW64_VERSION_MAJOR))
#endif

#if defined(__MINGW64_VERSION_MINOR)
# pragma message(HUNTER_INFO(__MINGW64_VERSION_MINOR))
#endif

#if defined(__MINGW64__)
# pragma message(HUNTER_INFO(__MINGW64__))
#endif

#if defined(__MIPSEB)
# pragma message(HUNTER_INFO(__MIPSEB))
#endif

#if defined(__MIPSEB__)
# pragma message(HUNTER_INFO(__MIPSEB__))
#endif

#if defined(__MIPSEL)
# pragma message(HUNTER_INFO(__MIPSEL))
#endif

#if defined(__MIPSEL__)
# pragma message(HUNTER_INFO(__MIPSEL__))
#endif

#if defined(__MIPS_ISA2__)
# pragma message(HUNTER_INFO(__MIPS_ISA2__))
#endif

#if defined(__MIPS_ISA3__)
# pragma message(HUNTER_INFO(__MIPS_ISA3__))
#endif

#if defined(__MIPS_ISA4__)
# pragma message(HUNTER_INFO(__MIPS_ISA4__))
#endif

#if defined(__MIPS__)
# pragma message(HUNTER_INFO(__MIPS__))
#endif

#if defined(__MMX__)
# pragma message(HUNTER_INFO(__MMX__))
#endif

#if defined(__MRC__)
# pragma message(HUNTER_INFO(__MRC__))
#endif

#if defined(__MSIPL_COMPILE_H)
# pragma message(HUNTER_INFO(__MSIPL_COMPILE_H))
#endif

#if defined(__MSL_CPP__)
# pragma message(HUNTER_INFO(__MSL_CPP__))
#endif

#if defined(__MSL__)
# pragma message(HUNTER_INFO(__MSL__))
#endif

#if defined(__MSVC_RUNTIME_CHECKS)
# pragma message(HUNTER_INFO(__MSVC_RUNTIME_CHECKS))
#endif

#if defined(__MWERKS__)
# pragma message(HUNTER_INFO(__MWERKS__))
#endif

#if defined(__NETBSD__)
# pragma message(HUNTER_INFO(__NETBSD__))
#endif

#if defined(__NETBSD_version)
# pragma message(HUNTER_INFO(__NETBSD_version))
#endif

#if defined(__NO_MATH_INLINES)
# pragma message(HUNTER_INFO(__NO_MATH_INLINES))
#endif

#if defined(__NetBSD_Version)
# pragma message(HUNTER_INFO(__NetBSD_Version))
#endif

#if defined(__NetBSD__)
# pragma message(HUNTER_INFO(__NetBSD__))
#endif

#if defined(__OBJC__)
# pragma message(HUNTER_INFO(__OBJC__))
#endif

#if defined(__ORDER_BIG_ENDIAN__)
# pragma message(HUNTER_INFO(__ORDER_BIG_ENDIAN__))
#endif

#if defined(__ORDER_LITTLE_ENDIAN__)
# pragma message(HUNTER_INFO(__ORDER_LITTLE_ENDIAN__))
#endif

#if defined(__ORDER_PDP_ENDIAN__)
# pragma message(HUNTER_INFO(__ORDER_PDP_ENDIAN__))
#endif

#if defined(__OS400__)
# pragma message(HUNTER_INFO(__OS400__))
#endif

#if defined(__OpenBSD__)
# pragma message(HUNTER_INFO(__OpenBSD__))
#endif

#if defined(__PA7100__)
# pragma message(HUNTER_INFO(__PA7100__))
#endif

#if defined(__PA8000__)
# pragma message(HUNTER_INFO(__PA8000__))
#endif

#if defined(__PATHCC__)
# pragma message(HUNTER_INFO(__PATHCC__))
#endif

#if defined(__PDP_ENDIAN)
# pragma message(HUNTER_INFO(__PDP_ENDIAN))
#endif

#if defined(__PGI)
# pragma message(HUNTER_INFO(__PGI))
#endif

#if defined(__PGIC_MINOR__)
# pragma message(HUNTER_INFO(__PGIC_MINOR__))
#endif

#if defined(__PGIC_PATCHLEVEL__)
# pragma message(HUNTER_INFO(__PGIC_PATCHLEVEL__))
#endif

#if defined(__PGIC__)
# pragma message(HUNTER_INFO(__PGIC__))
#endif

#if defined(__PIC__)
# pragma message(HUNTER_INFO(__PIC__))
#endif

#if defined(__PIE__)
# pragma message(HUNTER_INFO(__PIE__))
#endif

#if defined(__POINTER_WIDTH__)
# pragma message(HUNTER_INFO(__POINTER_WIDTH__))
#endif

#if defined(__POWERPC__)
# pragma message(HUNTER_INFO(__POWERPC__))
#endif

#if defined(__PPCBROADWAY__)
# pragma message(HUNTER_INFO(__PPCBROADWAY__))
#endif

#if defined(__PPCGECKO__)
# pragma message(HUNTER_INFO(__PPCGECKO__))
#endif

#if defined(__PRAGMA_REDEFINE_EXTNAME)
# pragma message(HUNTER_INFO(__PRAGMA_REDEFINE_EXTNAME))
#endif

#if defined(__PTRDIFF_MAX__)
# pragma message(HUNTER_INFO(__PTRDIFF_MAX__))
#endif

#if defined(__PTRDIFF_TYPE__)
# pragma message(HUNTER_INFO(__PTRDIFF_TYPE__))
#endif

#if defined(__PTRDIFF_WIDTH__)
# pragma message(HUNTER_INFO(__PTRDIFF_WIDTH__))
#endif

#if defined(__QNXNTO__)
# pragma message(HUNTER_INFO(__QNXNTO__))
#endif

#if defined(__QNX__)
# pragma message(HUNTER_INFO(__QNX__))
#endif

#if defined(__QQ_FBIT__)
# pragma message(HUNTER_INFO(__QQ_FBIT__))
#endif

#if defined(__QQ_IBIT__)
# pragma message(HUNTER_INFO(__QQ_IBIT__))
#endif

#if defined(__REGISTER_PREFIX__)
# pragma message(HUNTER_INFO(__REGISTER_PREFIX__))
#endif

#if defined(__RISC2_0__)
# pragma message(HUNTER_INFO(__RISC2_0__))
#endif

#if defined(__SACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__SACCUM_EPSILON__))
#endif

#if defined(__SACCUM_FBIT__)
# pragma message(HUNTER_INFO(__SACCUM_FBIT__))
#endif

#if defined(__SACCUM_IBIT__)
# pragma message(HUNTER_INFO(__SACCUM_IBIT__))
#endif

#if defined(__SACCUM_MAX__)
# pragma message(HUNTER_INFO(__SACCUM_MAX__))
#endif

#if defined(__SACCUM_MIN__)
# pragma message(HUNTER_INFO(__SACCUM_MIN__))
#endif

#if defined(__SA_FBIT__)
# pragma message(HUNTER_INFO(__SA_FBIT__))
#endif

#if defined(__SA_IBIT__)
# pragma message(HUNTER_INFO(__SA_IBIT__))
#endif

#if defined(__SCHAR_MAX__)
# pragma message(HUNTER_INFO(__SCHAR_MAX__))
#endif

#if defined(__SEG_FS)
# pragma message(HUNTER_INFO(__SEG_FS))
#endif

#if defined(__SEG_GS)
# pragma message(HUNTER_INFO(__SEG_GS))
#endif

#if defined(__SFRACT_EPSILON__)
# pragma message(HUNTER_INFO(__SFRACT_EPSILON__))
#endif

#if defined(__SFRACT_FBIT__)
# pragma message(HUNTER_INFO(__SFRACT_FBIT__))
#endif

#if defined(__SFRACT_IBIT__)
# pragma message(HUNTER_INFO(__SFRACT_IBIT__))
#endif

#if defined(__SFRACT_MAX__)
# pragma message(HUNTER_INFO(__SFRACT_MAX__))
#endif

#if defined(__SFRACT_MIN__)
# pragma message(HUNTER_INFO(__SFRACT_MIN__))
#endif

#if defined(__SGI_STL)
# pragma message(HUNTER_INFO(__SGI_STL))
#endif

#if defined(__SGI_STL_PORT)
# pragma message(HUNTER_INFO(__SGI_STL_PORT))
#endif

#if defined(__SH3__)
# pragma message(HUNTER_INFO(__SH3__))
#endif

#if defined(__SH4__)
# pragma message(HUNTER_INFO(__SH4__))
#endif

#if defined(__SH5__)
# pragma message(HUNTER_INFO(__SH5__))
#endif

#if defined(__SHRT_MAX__)
# pragma message(HUNTER_INFO(__SHRT_MAX__))
#endif

#if defined(__SIG_ATOMIC_MAX__)
# pragma message(HUNTER_INFO(__SIG_ATOMIC_MAX__))
#endif

#if defined(__SIG_ATOMIC_MIN__)
# pragma message(HUNTER_INFO(__SIG_ATOMIC_MIN__))
#endif

#if defined(__SIG_ATOMIC_TYPE__)
# pragma message(HUNTER_INFO(__SIG_ATOMIC_TYPE__))
#endif

#if defined(__SIG_ATOMIC_WIDTH__)
# pragma message(HUNTER_INFO(__SIG_ATOMIC_WIDTH__))
#endif

#if defined(__SIZEOF_DOUBLE__)
# pragma message(HUNTER_INFO(__SIZEOF_DOUBLE__))
#endif

#if defined(__SIZEOF_FLOAT128__)
# pragma message(HUNTER_INFO(__SIZEOF_FLOAT128__))
#endif

#if defined(__SIZEOF_FLOAT80__)
# pragma message(HUNTER_INFO(__SIZEOF_FLOAT80__))
#endif

#if defined(__SIZEOF_FLOAT__)
# pragma message(HUNTER_INFO(__SIZEOF_FLOAT__))
#endif

#if defined(__SIZEOF_INT128__)
# pragma message(HUNTER_INFO(__SIZEOF_INT128__))
#endif

#if defined(__SIZEOF_INT__)
# pragma message(HUNTER_INFO(__SIZEOF_INT__))
#endif

#if defined(__SIZEOF_LONG_DOUBLE__)
# pragma message(HUNTER_INFO(__SIZEOF_LONG_DOUBLE__))
#endif

#if defined(__SIZEOF_LONG_LONG__)
# pragma message(HUNTER_INFO(__SIZEOF_LONG_LONG__))
#endif

#if defined(__SIZEOF_LONG__)
# pragma message(HUNTER_INFO(__SIZEOF_LONG__))
#endif

#if defined(__SIZEOF_POINTER__)
# pragma message(HUNTER_INFO(__SIZEOF_POINTER__))
#endif

#if defined(__SIZEOF_PTRDIFF_T__)
# pragma message(HUNTER_INFO(__SIZEOF_PTRDIFF_T__))
#endif

#if defined(__SIZEOF_SHORT__)
# pragma message(HUNTER_INFO(__SIZEOF_SHORT__))
#endif

#if defined(__SIZEOF_SIZE_T__)
# pragma message(HUNTER_INFO(__SIZEOF_SIZE_T__))
#endif

#if defined(__SIZEOF_WCHAR_T__)
# pragma message(HUNTER_INFO(__SIZEOF_WCHAR_T__))
#endif

#if defined(__SIZEOF_WINT_T__)
# pragma message(HUNTER_INFO(__SIZEOF_WINT_T__))
#endif

#if defined(__SIZE_MAX__)
# pragma message(HUNTER_INFO(__SIZE_MAX__))
#endif

#if defined(__SIZE_TYPE__)
# pragma message(HUNTER_INFO(__SIZE_TYPE__))
#endif

#if defined(__SIZE_WIDTH__)
# pragma message(HUNTER_INFO(__SIZE_WIDTH__))
#endif

#if defined(__SQ_FBIT__)
# pragma message(HUNTER_INFO(__SQ_FBIT__))
#endif

#if defined(__SQ_IBIT__)
# pragma message(HUNTER_INFO(__SQ_IBIT__))
#endif

#if defined(__SSE2_MATH__)
# pragma message(HUNTER_INFO(__SSE2_MATH__))
#endif

#if defined(__SSE2__)
# pragma message(HUNTER_INFO(__SSE2__))
#endif

#if defined(__SSE3__)
# pragma message(HUNTER_INFO(__SSE3__))
#endif

#if defined(__SSE4A__)
# pragma message(HUNTER_INFO(__SSE4A__))
#endif

#if defined(__SSE4_1__)
# pragma message(HUNTER_INFO(__SSE4_1__))
#endif

#if defined(__SSE4_2__)
# pragma message(HUNTER_INFO(__SSE4_2__))
#endif

#if defined(__SSE_MATH__)
# pragma message(HUNTER_INFO(__SSE_MATH__))
#endif

#if defined(__SSE__)
# pragma message(HUNTER_INFO(__SSE__))
#endif

#if defined(__SSP_STRONG__)
# pragma message(HUNTER_INFO(__SSP_STRONG__))
#endif

#if defined(__SSP__)
# pragma message(HUNTER_INFO(__SSP__))
#endif

#if defined(__SSSE3__)
# pragma message(HUNTER_INFO(__SSSE3__))
#endif

#if defined(__STDCPP_DEFAULT_NEW_ALIGNMENT__)
# pragma message(HUNTER_INFO(__STDCPP_DEFAULT_NEW_ALIGNMENT__))
#endif

#if defined(__STDCPP_STRICT_POINTER_SAFETY__)
# pragma message(HUNTER_INFO(__STDCPP_STRICT_POINTER_SAFETY__))
#endif

#if defined(__STDCPP_THREADS__)
# pragma message(HUNTER_INFO(__STDCPP_THREADS__))
#endif

#if defined(__STDC_HOSTED__)
# pragma message(HUNTER_INFO(__STDC_HOSTED__))
#endif

#if defined(__STDC_IEC_559_COMPLEX__)
# pragma message(HUNTER_INFO(__STDC_IEC_559_COMPLEX__))
#endif

#if defined(__STDC_IEC_559__)
# pragma message(HUNTER_INFO(__STDC_IEC_559__))
#endif

#if defined(__STDC_ISO_10646__)
# pragma message(HUNTER_INFO(__STDC_ISO_10646__))
#endif

#if defined(__STDC_MB_MIGHT_NEQ_WC__)
# pragma message(HUNTER_INFO(__STDC_MB_MIGHT_NEQ_WC__))
#endif

#if defined(__STDC_NO_THREADS__)
# pragma message(HUNTER_INFO(__STDC_NO_THREADS__))
#endif

#if defined(__STDC_UTF_16__)
# pragma message(HUNTER_INFO(__STDC_UTF_16__))
#endif

#if defined(__STDC_UTF_32__)
# pragma message(HUNTER_INFO(__STDC_UTF_32__))
#endif

#if defined(__STDC_VERSION__)
# pragma message(HUNTER_INFO(__STDC_VERSION__))
#endif

#if defined(__STDC__)
# pragma message(HUNTER_INFO(__STDC__))
#endif

#if defined(__STD_RWCOMPILER_H__)
# pragma message(HUNTER_INFO(__STD_RWCOMPILER_H__))
#endif

#if defined(__STL_CONFIG_H)
# pragma message(HUNTER_INFO(__STL_CONFIG_H))
#endif

#if defined(__SUNPRO_C)
# pragma message(HUNTER_INFO(__SUNPRO_C))
#endif

#if defined(__SUNPRO_CC)
# pragma message(HUNTER_INFO(__SUNPRO_CC))
#endif

#if defined(__SVR4)
# pragma message(HUNTER_INFO(__SVR4))
#endif

#if defined(__SYSC_ZARCH__)
# pragma message(HUNTER_INFO(__SYSC_ZARCH__))
#endif

#if defined(__SYSC__)
# pragma message(HUNTER_INFO(__SYSC__))
#endif

#if defined(__TARGET_ARCH_ARM)
# pragma message(HUNTER_INFO(__TARGET_ARCH_ARM))
#endif

#if defined(__TARGET_ARCH_THUMB)
# pragma message(HUNTER_INFO(__TARGET_ARCH_THUMB))
#endif

#if defined(__TARGET_LIB__)
# pragma message(HUNTER_INFO(__TARGET_LIB__))
#endif

#if defined(__TA_FBIT__)
# pragma message(HUNTER_INFO(__TA_FBIT__))
#endif

#if defined(__TA_IBIT__)
# pragma message(HUNTER_INFO(__TA_IBIT__))
#endif

#if defined(__THUMBEB__)
# pragma message(HUNTER_INFO(__THUMBEB__))
#endif

#if defined(__THUMBEL__)
# pragma message(HUNTER_INFO(__THUMBEL__))
#endif

#if defined(__THUMB_INTERWORK__)
# pragma message(HUNTER_INFO(__THUMB_INTERWORK__))
#endif

#if defined(__THW_370__)
# pragma message(HUNTER_INFO(__THW_370__))
#endif

#if defined(__THW_INTEL__)
# pragma message(HUNTER_INFO(__THW_INTEL__))
#endif

#if defined(__THW_RS6000)
# pragma message(HUNTER_INFO(__THW_RS6000))
#endif

#if defined(__TOS_AIX__)
# pragma message(HUNTER_INFO(__TOS_AIX__))
#endif

#if defined(__TOS_WIN__)
# pragma message(HUNTER_INFO(__TOS_WIN__))
#endif

#if defined(__TQ_FBIT__)
# pragma message(HUNTER_INFO(__TQ_FBIT__))
#endif

#if defined(__TQ_IBIT__)
# pragma message(HUNTER_INFO(__TQ_IBIT__))
#endif

#if defined(__TenDRA__)
# pragma message(HUNTER_INFO(__TenDRA__))
#endif

#if defined(__UACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__UACCUM_EPSILON__))
#endif

#if defined(__UACCUM_FBIT__)
# pragma message(HUNTER_INFO(__UACCUM_FBIT__))
#endif

#if defined(__UACCUM_IBIT__)
# pragma message(HUNTER_INFO(__UACCUM_IBIT__))
#endif

#if defined(__UACCUM_MAX__)
# pragma message(HUNTER_INFO(__UACCUM_MAX__))
#endif

#if defined(__UACCUM_MIN__)
# pragma message(HUNTER_INFO(__UACCUM_MIN__))
#endif

#if defined(__UCLIBC__)
# pragma message(HUNTER_INFO(__UCLIBC__))
#endif

#if defined(__UDA_FBIT__)
# pragma message(HUNTER_INFO(__UDA_FBIT__))
#endif

#if defined(__UDA_IBIT__)
# pragma message(HUNTER_INFO(__UDA_IBIT__))
#endif

#if defined(__UDQ_FBIT__)
# pragma message(HUNTER_INFO(__UDQ_FBIT__))
#endif

#if defined(__UDQ_IBIT__)
# pragma message(HUNTER_INFO(__UDQ_IBIT__))
#endif

#if defined(__UFRACT_EPSILON__)
# pragma message(HUNTER_INFO(__UFRACT_EPSILON__))
#endif

#if defined(__UFRACT_FBIT__)
# pragma message(HUNTER_INFO(__UFRACT_FBIT__))
#endif

#if defined(__UFRACT_IBIT__)
# pragma message(HUNTER_INFO(__UFRACT_IBIT__))
#endif

#if defined(__UFRACT_MAX__)
# pragma message(HUNTER_INFO(__UFRACT_MAX__))
#endif

#if defined(__UFRACT_MIN__)
# pragma message(HUNTER_INFO(__UFRACT_MIN__))
#endif

#if defined(__UHA_FBIT__)
# pragma message(HUNTER_INFO(__UHA_FBIT__))
#endif

#if defined(__UHA_IBIT__)
# pragma message(HUNTER_INFO(__UHA_IBIT__))
#endif

#if defined(__UHQ_FBIT__)
# pragma message(HUNTER_INFO(__UHQ_FBIT__))
#endif

#if defined(__UHQ_IBIT__)
# pragma message(HUNTER_INFO(__UHQ_IBIT__))
#endif

#if defined(__UINT16_C)
# pragma message(HUNTER_INFO(__UINT16_C))
#endif

#if defined(__UINT16_MAX__)
# pragma message(HUNTER_INFO(__UINT16_MAX__))
#endif

#if defined(__UINT16_TYPE__)
# pragma message(HUNTER_INFO(__UINT16_TYPE__))
#endif

#if defined(__UINT32_C)
# pragma message(HUNTER_INFO(__UINT32_C))
#endif

#if defined(__UINT32_MAX__)
# pragma message(HUNTER_INFO(__UINT32_MAX__))
#endif

#if defined(__UINT32_TYPE__)
# pragma message(HUNTER_INFO(__UINT32_TYPE__))
#endif

#if defined(__UINT64_C)
# pragma message(HUNTER_INFO(__UINT64_C))
#endif

#if defined(__UINT64_MAX__)
# pragma message(HUNTER_INFO(__UINT64_MAX__))
#endif

#if defined(__UINT64_TYPE__)
# pragma message(HUNTER_INFO(__UINT64_TYPE__))
#endif

#if defined(__UINT8_C)
# pragma message(HUNTER_INFO(__UINT8_C))
#endif

#if defined(__UINT8_MAX__)
# pragma message(HUNTER_INFO(__UINT8_MAX__))
#endif

#if defined(__UINT8_TYPE__)
# pragma message(HUNTER_INFO(__UINT8_TYPE__))
#endif

#if defined(__UINTMAX_C)
# pragma message(HUNTER_INFO(__UINTMAX_C))
#endif

#if defined(__UINTMAX_MAX__)
# pragma message(HUNTER_INFO(__UINTMAX_MAX__))
#endif

#if defined(__UINTMAX_TYPE__)
# pragma message(HUNTER_INFO(__UINTMAX_TYPE__))
#endif

#if defined(__UINTPTR_MAX__)
# pragma message(HUNTER_INFO(__UINTPTR_MAX__))
#endif

#if defined(__UINTPTR_TYPE__)
# pragma message(HUNTER_INFO(__UINTPTR_TYPE__))
#endif

#if defined(__UINT_FAST16_MAX__)
# pragma message(HUNTER_INFO(__UINT_FAST16_MAX__))
#endif

#if defined(__UINT_FAST16_TYPE__)
# pragma message(HUNTER_INFO(__UINT_FAST16_TYPE__))
#endif

#if defined(__UINT_FAST32_MAX__)
# pragma message(HUNTER_INFO(__UINT_FAST32_MAX__))
#endif

#if defined(__UINT_FAST32_TYPE__)
# pragma message(HUNTER_INFO(__UINT_FAST32_TYPE__))
#endif

#if defined(__UINT_FAST64_MAX__)
# pragma message(HUNTER_INFO(__UINT_FAST64_MAX__))
#endif

#if defined(__UINT_FAST64_TYPE__)
# pragma message(HUNTER_INFO(__UINT_FAST64_TYPE__))
#endif

#if defined(__UINT_FAST8_MAX__)
# pragma message(HUNTER_INFO(__UINT_FAST8_MAX__))
#endif

#if defined(__UINT_FAST8_TYPE__)
# pragma message(HUNTER_INFO(__UINT_FAST8_TYPE__))
#endif

#if defined(__UINT_LEAST16_MAX__)
# pragma message(HUNTER_INFO(__UINT_LEAST16_MAX__))
#endif

#if defined(__UINT_LEAST16_TYPE__)
# pragma message(HUNTER_INFO(__UINT_LEAST16_TYPE__))
#endif

#if defined(__UINT_LEAST32_MAX__)
# pragma message(HUNTER_INFO(__UINT_LEAST32_MAX__))
#endif

#if defined(__UINT_LEAST32_TYPE__)
# pragma message(HUNTER_INFO(__UINT_LEAST32_TYPE__))
#endif

#if defined(__UINT_LEAST64_MAX__)
# pragma message(HUNTER_INFO(__UINT_LEAST64_MAX__))
#endif

#if defined(__UINT_LEAST64_TYPE__)
# pragma message(HUNTER_INFO(__UINT_LEAST64_TYPE__))
#endif

#if defined(__UINT_LEAST8_MAX__)
# pragma message(HUNTER_INFO(__UINT_LEAST8_MAX__))
#endif

#if defined(__UINT_LEAST8_TYPE__)
# pragma message(HUNTER_INFO(__UINT_LEAST8_TYPE__))
#endif

#if defined(__ULACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__ULACCUM_EPSILON__))
#endif

#if defined(__ULACCUM_FBIT__)
# pragma message(HUNTER_INFO(__ULACCUM_FBIT__))
#endif

#if defined(__ULACCUM_IBIT__)
# pragma message(HUNTER_INFO(__ULACCUM_IBIT__))
#endif

#if defined(__ULACCUM_MAX__)
# pragma message(HUNTER_INFO(__ULACCUM_MAX__))
#endif

#if defined(__ULACCUM_MIN__)
# pragma message(HUNTER_INFO(__ULACCUM_MIN__))
#endif

#if defined(__ULFRACT_EPSILON__)
# pragma message(HUNTER_INFO(__ULFRACT_EPSILON__))
#endif

#if defined(__ULFRACT_FBIT__)
# pragma message(HUNTER_INFO(__ULFRACT_FBIT__))
#endif

#if defined(__ULFRACT_IBIT__)
# pragma message(HUNTER_INFO(__ULFRACT_IBIT__))
#endif

#if defined(__ULFRACT_MAX__)
# pragma message(HUNTER_INFO(__ULFRACT_MAX__))
#endif

#if defined(__ULFRACT_MIN__)
# pragma message(HUNTER_INFO(__ULFRACT_MIN__))
#endif

#if defined(__ULLACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__ULLACCUM_EPSILON__))
#endif

#if defined(__ULLACCUM_FBIT__)
# pragma message(HUNTER_INFO(__ULLACCUM_FBIT__))
#endif

#if defined(__ULLACCUM_IBIT__)
# pragma message(HUNTER_INFO(__ULLACCUM_IBIT__))
#endif

#if defined(__ULLACCUM_MAX__)
# pragma message(HUNTER_INFO(__ULLACCUM_MAX__))
#endif

#if defined(__ULLACCUM_MIN__)
# pragma message(HUNTER_INFO(__ULLACCUM_MIN__))
#endif

#if defined(__ULLFRACT_EPSILON__)
# pragma message(HUNTER_INFO(__ULLFRACT_EPSILON__))
#endif

#if defined(__ULLFRACT_FBIT__)
# pragma message(HUNTER_INFO(__ULLFRACT_FBIT__))
#endif

#if defined(__ULLFRACT_IBIT__)
# pragma message(HUNTER_INFO(__ULLFRACT_IBIT__))
#endif

#if defined(__ULLFRACT_MAX__)
# pragma message(HUNTER_INFO(__ULLFRACT_MAX__))
#endif

#if defined(__ULLFRACT_MIN__)
# pragma message(HUNTER_INFO(__ULLFRACT_MIN__))
#endif

#if defined(__UQQ_FBIT__)
# pragma message(HUNTER_INFO(__UQQ_FBIT__))
#endif

#if defined(__UQQ_IBIT__)
# pragma message(HUNTER_INFO(__UQQ_IBIT__))
#endif

#if defined(__USACCUM_EPSILON__)
# pragma message(HUNTER_INFO(__USACCUM_EPSILON__))
#endif

#if defined(__USACCUM_FBIT__)
# pragma message(HUNTER_INFO(__USACCUM_FBIT__))
#endif

#if defined(__USACCUM_IBIT__)
# pragma message(HUNTER_INFO(__USACCUM_IBIT__))
#endif

#if defined(__USACCUM_MAX__)
# pragma message(HUNTER_INFO(__USACCUM_MAX__))
#endif

#if defined(__USACCUM_MIN__)
# pragma message(HUNTER_INFO(__USACCUM_MIN__))
#endif

#if defined(__USA_FBIT__)
# pragma message(HUNTER_INFO(__USA_FBIT__))
#endif

#if defined(__USA_IBIT__)
# pragma message(HUNTER_INFO(__USA_IBIT__))
#endif

#if defined(__USER_LABEL_PREFIX__)
# pragma message(HUNTER_INFO(__USER_LABEL_PREFIX__))
#endif

#if defined(__USFRACT_EPSILON__)
# pragma message(HUNTER_INFO(__USFRACT_EPSILON__))
#endif

#if defined(__USFRACT_FBIT__)
# pragma message(HUNTER_INFO(__USFRACT_FBIT__))
#endif

#if defined(__USFRACT_IBIT__)
# pragma message(HUNTER_INFO(__USFRACT_IBIT__))
#endif

#if defined(__USFRACT_MAX__)
# pragma message(HUNTER_INFO(__USFRACT_MAX__))
#endif

#if defined(__USFRACT_MIN__)
# pragma message(HUNTER_INFO(__USFRACT_MIN__))
#endif

#if defined(__USING_SJLJ_EXCEPTIONS__)
# pragma message(HUNTER_INFO(__USING_SJLJ_EXCEPTIONS__))
#endif

#if defined(__USQ_FBIT__)
# pragma message(HUNTER_INFO(__USQ_FBIT__))
#endif

#if defined(__USQ_IBIT__)
# pragma message(HUNTER_INFO(__USQ_IBIT__))
#endif

#if defined(__UTA_FBIT__)
# pragma message(HUNTER_INFO(__UTA_FBIT__))
#endif

#if defined(__UTA_IBIT__)
# pragma message(HUNTER_INFO(__UTA_IBIT__))
#endif

#if defined(__UTQ_FBIT__)
# pragma message(HUNTER_INFO(__UTQ_FBIT__))
#endif

#if defined(__UTQ_IBIT__)
# pragma message(HUNTER_INFO(__UTQ_IBIT__))
#endif

#if defined(__VECTOR4DOUBLE__)
# pragma message(HUNTER_INFO(__VECTOR4DOUBLE__))
#endif

#if defined(__VEC__)
# pragma message(HUNTER_INFO(__VEC__))
#endif

#if defined(__VERSION__)
# pragma message(HUNTER_INFO(__VERSION__))
#endif

#if defined(__VFP_FP__)
# pragma message(HUNTER_INFO(__VFP_FP__))
#endif

#if defined(__VMS)
# pragma message(HUNTER_INFO(__VMS))
#endif

#if defined(__VMS_VER)
# pragma message(HUNTER_INFO(__VMS_VER))
#endif

#if defined(__VSX__)
# pragma message(HUNTER_INFO(__VSX__))
#endif

#if defined(__WATCOMC__)
# pragma message(HUNTER_INFO(__WATCOMC__))
#endif

#if defined(__WCHAR_MAX__)
# pragma message(HUNTER_INFO(__WCHAR_MAX__))
#endif

#if defined(__WCHAR_MIN__)
# pragma message(HUNTER_INFO(__WCHAR_MIN__))
#endif

#if defined(__WCHAR_TYPE__)
# pragma message(HUNTER_INFO(__WCHAR_TYPE__))
#endif

#if defined(__WCHAR_UNSIGNED__)
# pragma message(HUNTER_INFO(__WCHAR_UNSIGNED__))
#endif

#if defined(__WCHAR_WIDTH__)
# pragma message(HUNTER_INFO(__WCHAR_WIDTH__))
#endif

#if defined(__WIN32__)
# pragma message(HUNTER_INFO(__WIN32__))
#endif

#if defined(__WINDOWS__)
# pragma message(HUNTER_INFO(__WINDOWS__))
#endif

#if defined(__WINT_MAX__)
# pragma message(HUNTER_INFO(__WINT_MAX__))
#endif

#if defined(__WINT_MIN__)
# pragma message(HUNTER_INFO(__WINT_MIN__))
#endif

#if defined(__WINT_TYPE__)
# pragma message(HUNTER_INFO(__WINT_TYPE__))
#endif

#if defined(__WINT_WIDTH__)
# pragma message(HUNTER_INFO(__WINT_WIDTH__))
#endif

#if defined(__XOP__)
# pragma message(HUNTER_INFO(__XOP__))
#endif

#if defined(__aarch64__)
# pragma message(HUNTER_INFO(__aarch64__))
#endif

#if defined(__alpha)
# pragma message(HUNTER_INFO(__alpha))
#endif

#if defined(__alpha__)
# pragma message(HUNTER_INFO(__alpha__))
#endif

#if defined(__alpha_ev4__)
# pragma message(HUNTER_INFO(__alpha_ev4__))
#endif

#if defined(__alpha_ev5__)
# pragma message(HUNTER_INFO(__alpha_ev5__))
#endif

#if defined(__alpha_ev6__)
# pragma message(HUNTER_INFO(__alpha_ev6__))
#endif

#if defined(__amd64)
# pragma message(HUNTER_INFO(__amd64))
#endif

#if defined(__amd64__)
# pragma message(HUNTER_INFO(__amd64__))
#endif

#if defined(__amigaos__)
# pragma message(HUNTER_INFO(__amigaos__))
#endif

#if defined(__apple_build_version__)
# pragma message(HUNTER_INFO(__apple_build_version__))
#endif

#if defined(__arm)
# pragma message(HUNTER_INFO(__arm))
#endif

#if defined(__arm64)
# pragma message(HUNTER_INFO(__arm64))
#endif

#if defined(__arm64__)
# pragma message(HUNTER_INFO(__arm64__))
#endif

#if defined(__arm__)
# pragma message(HUNTER_INFO(__arm__))
#endif

#if defined(__bfin__)
# pragma message(HUNTER_INFO(__bfin__))
#endif

#if defined(__block)
# pragma message(HUNTER_INFO(__block))
#endif

#if defined(__bsdi__)
# pragma message(HUNTER_INFO(__bsdi__))
#endif

#if defined(__clang__)
# pragma message(HUNTER_INFO(__clang__))
#endif

#if defined(__clang_major__)
# pragma message(HUNTER_INFO(__clang_major__))
#endif

#if defined(__clang_minor__)
# pragma message(HUNTER_INFO(__clang_minor__))
#endif

#if defined(__clang_patchlevel__)
# pragma message(HUNTER_INFO(__clang_patchlevel__))
#endif

#if defined(__clang_version__)
# pragma message(HUNTER_INFO(__clang_version__))
#endif

#if defined(__code_model_small__)
# pragma message(HUNTER_INFO(__code_model_small__))
#endif

#if defined(__convex__)
# pragma message(HUNTER_INFO(__convex__))
#endif

#if defined(__convex_c1__)
# pragma message(HUNTER_INFO(__convex_c1__))
#endif

#if defined(__convex_c2__)
# pragma message(HUNTER_INFO(__convex_c2__))
#endif

#if defined(__convex_c32__)
# pragma message(HUNTER_INFO(__convex_c32__))
#endif

#if defined(__convex_c34__)
# pragma message(HUNTER_INFO(__convex_c34__))
#endif

#if defined(__convex_c38__)
# pragma message(HUNTER_INFO(__convex_c38__))
#endif

#if defined(__core2)
# pragma message(HUNTER_INFO(__core2))
#endif

#if defined(__core2__)
# pragma message(HUNTER_INFO(__core2__))
#endif

#if defined(__cplusplus)
# pragma message(HUNTER_INFO(__cplusplus))
#endif

#if defined(__cplusplus_cli)
# pragma message(HUNTER_INFO(__cplusplus_cli))
#endif

#if defined(__cplusplus_winrt)
# pragma message(HUNTER_INFO(__cplusplus_winrt))
#endif

#if defined(__cpp_aggregate_nsdmi)
# pragma message(HUNTER_INFO(__cpp_aggregate_nsdmi))
#endif

#if defined(__cpp_alias_templates)
# pragma message(HUNTER_INFO(__cpp_alias_templates))
#endif

#if defined(__cpp_attributes)
# pragma message(HUNTER_INFO(__cpp_attributes))
#endif

#if defined(__cpp_binary_literals)
# pragma message(HUNTER_INFO(__cpp_binary_literals))
#endif

#if defined(__cpp_constexpr)
# pragma message(HUNTER_INFO(__cpp_constexpr))
#endif

#if defined(__cpp_decltype)
# pragma message(HUNTER_INFO(__cpp_decltype))
#endif

#if defined(__cpp_decltype_auto)
# pragma message(HUNTER_INFO(__cpp_decltype_auto))
#endif

#if defined(__cpp_delegating_constructors)
# pragma message(HUNTER_INFO(__cpp_delegating_constructors))
#endif

#if defined(__cpp_digit_separators)
# pragma message(HUNTER_INFO(__cpp_digit_separators))
#endif

#if defined(__cpp_exceptions)
# pragma message(HUNTER_INFO(__cpp_exceptions))
#endif

#if defined(__cpp_generic_lambdas)
# pragma message(HUNTER_INFO(__cpp_generic_lambdas))
#endif

#if defined(__cpp_hex_float)
# pragma message(HUNTER_INFO(__cpp_hex_float))
#endif

#if defined(__cpp_inheriting_constructors)
# pragma message(HUNTER_INFO(__cpp_inheriting_constructors))
#endif

#if defined(__cpp_init_captures)
# pragma message(HUNTER_INFO(__cpp_init_captures))
#endif

#if defined(__cpp_initializer_lists)
# pragma message(HUNTER_INFO(__cpp_initializer_lists))
#endif

#if defined(__cpp_lambdas)
# pragma message(HUNTER_INFO(__cpp_lambdas))
#endif

#if defined(__cpp_nsdmi)
# pragma message(HUNTER_INFO(__cpp_nsdmi))
#endif

#if defined(__cpp_range_based_for)
# pragma message(HUNTER_INFO(__cpp_range_based_for))
#endif

#if defined(__cpp_raw_strings)
# pragma message(HUNTER_INFO(__cpp_raw_strings))
#endif

#if defined(__cpp_ref_qualifiers)
# pragma message(HUNTER_INFO(__cpp_ref_qualifiers))
#endif

#if defined(__cpp_return_type_deduction)
# pragma message(HUNTER_INFO(__cpp_return_type_deduction))
#endif

#if defined(__cpp_rtti)
# pragma message(HUNTER_INFO(__cpp_rtti))
#endif

#if defined(__cpp_runtime_arrays)
# pragma message(HUNTER_INFO(__cpp_runtime_arrays))
#endif

#if defined(__cpp_rvalue_reference)
# pragma message(HUNTER_INFO(__cpp_rvalue_reference))
#endif

#if defined(__cpp_sized_deallocation)
# pragma message(HUNTER_INFO(__cpp_sized_deallocation))
#endif

#if defined(__cpp_static_assert)
# pragma message(HUNTER_INFO(__cpp_static_assert))
#endif

#if defined(__cpp_unicode_characters)
# pragma message(HUNTER_INFO(__cpp_unicode_characters))
#endif

#if defined(__cpp_unicode_literals)
# pragma message(HUNTER_INFO(__cpp_unicode_literals))
#endif

#if defined(__cpp_user_defined_literals)
# pragma message(HUNTER_INFO(__cpp_user_defined_literals))
#endif

#if defined(__cpp_variable_templates)
# pragma message(HUNTER_INFO(__cpp_variable_templates))
#endif

#if defined(__cpp_variadic_templates)
# pragma message(HUNTER_INFO(__cpp_variadic_templates))
#endif

#if defined(__embedded_cplusplus)
# pragma message(HUNTER_INFO(__embedded_cplusplus))
#endif

#if defined(__ghs)
# pragma message(HUNTER_INFO(__ghs))
#endif

#if defined(__ghs__)
# pragma message(HUNTER_INFO(__ghs__))
#endif

#if defined(__gnu_linux__)
# pragma message(HUNTER_INFO(__gnu_linux__))
#endif

#if defined(__hppa)
# pragma message(HUNTER_INFO(__hppa))
#endif

#if defined(__hppa__)
# pragma message(HUNTER_INFO(__hppa__))
#endif

#if defined(__hpux)
# pragma message(HUNTER_INFO(__hpux))
#endif

#if defined(__i386)
# pragma message(HUNTER_INFO(__i386))
#endif

#if defined(__i386__)
# pragma message(HUNTER_INFO(__i386__))
#endif

#if defined(__i486__)
# pragma message(HUNTER_INFO(__i486__))
#endif

#if defined(__i586__)
# pragma message(HUNTER_INFO(__i586__))
#endif

#if defined(__i686__)
# pragma message(HUNTER_INFO(__i686__))
#endif

#if defined(__ia64)
# pragma message(HUNTER_INFO(__ia64))
#endif

#if defined(__ia64__)
# pragma message(HUNTER_INFO(__ia64__))
#endif

#if defined(__itanium__)
# pragma message(HUNTER_INFO(__itanium__))
#endif

#if defined(__k8)
# pragma message(HUNTER_INFO(__k8))
#endif

#if defined(__k8__)
# pragma message(HUNTER_INFO(__k8__))
#endif

#if defined(__linux)
# pragma message(HUNTER_INFO(__linux))
#endif

#if defined(__linux__)
# pragma message(HUNTER_INFO(__linux__))
#endif

#if defined(__llvm__)
# pragma message(HUNTER_INFO(__llvm__))
#endif

#if defined(__m68k__)
# pragma message(HUNTER_INFO(__m68k__))
#endif

#if defined(__mc68000)
# pragma message(HUNTER_INFO(__mc68000))
#endif

#if defined(__mc68000__)
# pragma message(HUNTER_INFO(__mc68000__))
#endif

#if defined(__mc68010)
# pragma message(HUNTER_INFO(__mc68010))
#endif

#if defined(__mc68010__)
# pragma message(HUNTER_INFO(__mc68010__))
#endif

#if defined(__mc68020)
# pragma message(HUNTER_INFO(__mc68020))
#endif

#if defined(__mc68020__)
# pragma message(HUNTER_INFO(__mc68020__))
#endif

#if defined(__mc68030)
# pragma message(HUNTER_INFO(__mc68030))
#endif

#if defined(__mc68030__)
# pragma message(HUNTER_INFO(__mc68030__))
#endif

#if defined(__mc68040)
# pragma message(HUNTER_INFO(__mc68040))
#endif

#if defined(__mc68040__)
# pragma message(HUNTER_INFO(__mc68040__))
#endif

#if defined(__mc68060)
# pragma message(HUNTER_INFO(__mc68060))
#endif

#if defined(__mc68060__)
# pragma message(HUNTER_INFO(__mc68060__))
#endif

#if defined(__mips)
# pragma message(HUNTER_INFO(__mips))
#endif

#if defined(__mips__)
# pragma message(HUNTER_INFO(__mips__))
#endif

#if defined(__nocona)
# pragma message(HUNTER_INFO(__nocona))
#endif

#if defined(__nocona__)
# pragma message(HUNTER_INFO(__nocona__))
#endif

#if defined(__pic__)
# pragma message(HUNTER_INFO(__pic__))
#endif

#if defined(__pie__)
# pragma message(HUNTER_INFO(__pie__))
#endif

#if defined(__powerpc)
# pragma message(HUNTER_INFO(__powerpc))
#endif

#if defined(__powerpc__)
# pragma message(HUNTER_INFO(__powerpc__))
#endif

#if defined(__ppc601__)
# pragma message(HUNTER_INFO(__ppc601__))
#endif

#if defined(__ppc603__)
# pragma message(HUNTER_INFO(__ppc603__))
#endif

#if defined(__ppc604__)
# pragma message(HUNTER_INFO(__ppc604__))
#endif

#if defined(__ppc__)
# pragma message(HUNTER_INFO(__ppc__))
#endif

#if defined(__private_extern__)
# pragma message(HUNTER_INFO(__private_extern__))
#endif

#if defined(__s390__)
# pragma message(HUNTER_INFO(__s390__))
#endif

#if defined(__s390x__)
# pragma message(HUNTER_INFO(__s390x__))
#endif

#if defined(__sgi)
# pragma message(HUNTER_INFO(__sgi))
#endif

#if defined(__sh1__)
# pragma message(HUNTER_INFO(__sh1__))
#endif

#if defined(__sh2__)
# pragma message(HUNTER_INFO(__sh2__))
#endif

#if defined(__sh3__)
# pragma message(HUNTER_INFO(__sh3__))
#endif

#if defined(__sh__)
# pragma message(HUNTER_INFO(__sh__))
#endif

#if defined(__sparc)
# pragma message(HUNTER_INFO(__sparc))
#endif

#if defined(__sparc__)
# pragma message(HUNTER_INFO(__sparc__))
#endif

#if defined(__sparcv8)
# pragma message(HUNTER_INFO(__sparcv8))
#endif

#if defined(__sparcv9)
# pragma message(HUNTER_INFO(__sparcv9))
#endif

#if defined(__strong)
# pragma message(HUNTER_INFO(__strong))
#endif

#if defined(__sun)
# pragma message(HUNTER_INFO(__sun))
#endif

#if defined(__svr4__)
# pragma message(HUNTER_INFO(__svr4__))
#endif

#if defined(__sysv__)
# pragma message(HUNTER_INFO(__sysv__))
#endif

#if defined(__thumb2__)
# pragma message(HUNTER_INFO(__thumb2__))
#endif

#if defined(__thumb__)
# pragma message(HUNTER_INFO(__thumb__))
#endif

#if defined(__tune_core2__)
# pragma message(HUNTER_INFO(__tune_core2__))
#endif

#if defined(__tune_nocona__)
# pragma message(HUNTER_INFO(__tune_nocona__))
#endif

#if defined(__unix)
# pragma message(HUNTER_INFO(__unix))
#endif

#if defined(__unix__)
# pragma message(HUNTER_INFO(__unix__))
#endif

#if defined(__unsafe_unretained)
# pragma message(HUNTER_INFO(__unsafe_unretained))
#endif

#if defined(__weak)
# pragma message(HUNTER_INFO(__weak))
#endif

#if defined(__x86_64)
# pragma message(HUNTER_INFO(__x86_64))
#endif

#if defined(__x86_64__)
# pragma message(HUNTER_INFO(__x86_64__))
#endif

#if defined(__xlC__)
# pragma message(HUNTER_INFO(__xlC__))
#endif

#if defined(__xlc__)
# pragma message(HUNTER_INFO(__xlc__))
#endif

#if defined(_hpux)
# pragma message(HUNTER_INFO(_hpux))
#endif

#if defined(__has_feature)
# if __has_feature(address_sanitizer)
#  pragma message(HUNTER_INFO(__HUNTER_DETECT_FEATURE_address_sanitizer))
# endif
#endif

#if defined(__has_feature)
# if __has_feature(memory_sanitizer)
#  pragma message(HUNTER_INFO(__HUNTER_DETECT_FEATURE_memory_sanitizer))
# endif
#endif

#if defined(__has_feature)
# if __has_feature(thread_sanitizer)
#  pragma message(HUNTER_INFO(__HUNTER_DETECT_FEATURE_thread_sanitizer))
# endif
#endif

int main() {
}
