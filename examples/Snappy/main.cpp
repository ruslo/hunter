#include <snappy.h>

int main()
{
    const char input[] = "Hunter is great!";
    std::string output;
    size_t size = snappy::Compress(input, sizeof(input), &output);
    if (size == 0)
        return 2;

    if (!snappy::IsValidCompressedBuffer(output.data(), output.size()))
        return 1;

    return 0;
}
