#include <rocksdb/slice.h>

int main()
{
    rocksdb::Slice slice;
    std::string str = slice.ToString();
    return static_cast<int>(str.size());
}
