#include <uv.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main() {
    uv_loop_t *loop = malloc(sizeof(uv_loop_t));
    assert(loop);
    uv_loop_init(loop);

    printf("Now quitting.\n");
    uv_run(loop, UV_RUN_DEFAULT);

    uv_loop_close(loop);
    free(loop);
    return 0;
}
