#include <FastNoiseSIMD/FastNoiseSIMD.h>

int main(int argc, char **argv)
{
    size_t simdLevel=FastNoise::GetFastestSIMD();

    auto noise=FastNoise::CreateNoise(1337, simdLevel);
}
