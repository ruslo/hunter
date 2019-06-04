// https://c-programming-blog.blogspot.com/2015/05/pcre2-simple-sample-program.html

#include <stdio.h>
#include <pcre2.h>

int main(int argc, char *argv[]) {
  if(argc < 3) {
    printf("usage: %s pattern string\n", argv[0]);
    return 0;
  }
  pcre2_code *re;
  pcre2_match_data *match_data;
  //  size_t erroffset;
  //  size_t *ovector;
  PCRE2_SIZE erroffset, *ovector;
  int errorcode;
  int rc;
  PCRE2_SPTR pattern = argv[1];
  PCRE2_SPTR value = argv[2];
  re = pcre2_compile(pattern, -1, 0, &errorcode, &erroffset, NULL);
  if (re == NULL) {
    PCRE2_UCHAR8 buffer[120];
    (void)pcre2_get_error_message(errorcode, buffer, 120);
    /* Handle error */
    return 0;
  }
  match_data = pcre2_match_data_create(20, NULL);
  rc = pcre2_match(re, value, -1, 0, 0, match_data, NULL);
  if (rc <= 0)
    printf("No matchx\n");
  else {
    ovector = pcre2_get_ovector_pointer(match_data);
    printf( "Match succeeded at offset %zu\n", ovector[0] );
    /* Use ovector to get matched strings */
    PCRE2_SIZE i;
    for(i = 0; i < rc; i++) {
      PCRE2_SPTR start = value + ovector[2*i];
      PCRE2_SIZE slen = ovector[2*i+1] - ovector[2*i];
      printf( "%2d: %.*s\n", i, (int)slen, (char *)start );
      break;
    }
  }
  pcre2_match_data_free(match_data);
  pcre2_code_free(re);
}
