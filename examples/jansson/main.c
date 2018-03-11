#include <jansson.h>

int main()
{
    json_malloc_t malloc_fn;
    json_free_t free_fn;
    json_get_alloc_funcs(&malloc_fn, &free_fn);
    return 0;
}
