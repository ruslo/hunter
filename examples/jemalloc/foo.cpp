#include <jemalloc/jemalloc.h>

int main() {
    void *data = je_malloc(1024*1024);
}
