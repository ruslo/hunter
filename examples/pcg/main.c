#include <stdint.h>
#include <pcg_variants.h>

int main()
{
    pcg32_random_t state;
    uint64_t seed[2];
    pcg32_srandom_r(&state, seed[0], seed[1]);
    return 0;
}
