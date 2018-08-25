#include <string.h>
#include <evhtp/evhtp.h>

int main()
{
    const char* query_str = "?test=true&x=1";
    evhtp_query_t* query = evhtp_parse_query(query_str, strlen(query_str));
    evhtp_query_free(query);
    return 0;
}
