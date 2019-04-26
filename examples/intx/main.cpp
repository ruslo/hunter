// Copyright(c) 2019, Pawel Bylica

#include <intx/intx.hpp>

int main()
{
    auto r = intx::uint512{1, 0} / intx::uint512{1};
    return static_cast<int>(r);
}
