/* funz1.f -- translated by f2c (version of 16 May 1991  13:06:06).
   You must link the resulting object file with the libraries:
        -link <S|C|M|L>f2c.lib   (in that order)
*/

#include <math.h>
#include <stdio.h>
#include <float.h>
#include <stdlib.h>
#include <limits.h>

/* C    D1MACH.FOR - Double Precision Machine Constants */
/* C */
double d1mach_(long *i)
{
  switch (*i)
    {
    case 1:
      return DBL_MIN;
    case 2:
      return DBL_MAX;
    case 3:
      return DBL_EPSILON/FLT_RADIX;
    case 4:
      return DBL_EPSILON;
    case 5:
      return log10(FLT_RADIX);
    }
  fprintf(stderr, "invalid argument: d1mach(%ld)\n", *i);
  exit(1);
  return 0; /* for compilers that complain of missing return values */
}

/* C    I1MACH.FOR - Integer Machine Constants */
/* C */
long i1mach_(long *i)
{
  switch (*i)
    {
    case 1:
      return 5; /* standard input */
    case 2:
      return 6; /* standard output */
    case 3:
      return 7; /* standard punch */
    case 4:
      return 0; /* standard error */
    case 5:
      return 32;  /* bits per integer */
    case 6:
      return 1; /* Fortran 77 value */
    case 7:
      return 2; /* base for integers */
    case 8:
      return 31;  /* digits of integer base */
    case 9:
      return LONG_MAX;
    case 10:
      return FLT_RADIX;
    case 11:
      return FLT_MANT_DIG;
    case 12:
      return FLT_MIN_EXP;
    case 13:
      return FLT_MAX_EXP;
    case 14:
      return DBL_MANT_DIG;
    case 15:
      return DBL_MIN_EXP;
    case 16:
      return DBL_MAX_EXP;
    }
  fprintf(stderr, "invalid argument: i1mach(%ld)\n", *i);
  exit(1);
  return 0; /* for compilers that complain of missing return values */
}


float r1mach_(long *i)
{
  switch (*i)
    {
    case 1:
      return FLT_MIN;
    case 2:
      return FLT_MAX;
    case 3:
      return FLT_EPSILON/FLT_RADIX;
    case 4:
      return FLT_EPSILON;
    case 5:
      return log10(FLT_RADIX);
    }
  fprintf(stderr, "invalid argument: r1mach(%ld)\n", *i);
  exit(1);
  return 0; /* for compilers that complain of missing return values */
}
