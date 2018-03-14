#include <stdint.h>
#include <pcg_variants.h>

int main()
{
    uint64_t seed[2];
    pcg32_srandom_r(&rng->state, seed[0], seed[1]);
    return 0;
}
