#include <HastyNoise/hastyNoise.h>

int main(int argc, char **argv)
{
    size_t simdLevel=HastyNoise::GetFastestSIMD();

    auto noise=HastyNoise::CreateNoise(1337, simdLevel);
}
