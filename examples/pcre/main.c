#include <string.h>
#include <stdio.h>
#include <pcre.h>

int main(int argc, char** argv) {
  pcre* re;
  const char* error;
  int erroffset;
  const char* pattern = "^[A-Za-z]+$";
  const char* subject = "AbCdEfGhIjKlMnOpQrStUvWxYz";
  int ovector[30];


  re = pcre_compile(
    pattern,              /* the pattern */
    0,                    /* default options */
    &error,               /* for error message */
    &erroffset,           /* for error offset */
    NULL);                /* use default character tables */

  int rc = pcre_exec(
    re,                   /* the compiled pattern */
    NULL,                 /* no extra data - we didn't study the pattern */
    subject,              /* the subject string */
    strlen(subject),      /* the length of the subject */
    0,                    /* start at offset 0 in the subject */
    0,                    /* default options */
    ovector,              /* output vector for substring information */
    30);           /* number of elements in the output vector */

  /* Matching failed: handle error cases */
  if (rc < 0) {
    switch(rc) {
      case PCRE_ERROR_NOMATCH: printf("No match\n"); break;

      /*
      Handle other special cases if you like
      */
      default: printf("Matching error %d\n", rc); break;
    }

    pcre_free(re);     /* Release memory used for the compiled pattern */
    return 1;
  }


  printf("\nMatch succeeded at offset %d\n", ovector[0]);

  return 0;
}
