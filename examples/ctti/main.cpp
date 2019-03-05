#include <ctti/nameof.hpp>
#include <ctti/type_id.hpp>
#include <iostream>
#include <unordered_map>

struct foo
{
    int i=0;
};

int f(const std::string&, int)
{
    return 42;
}

enum class bar_enum
{
    FOO,
    BAR,
    QUUX
};

int main()
{
    static_assert(ctti::type_id<int>()!=ctti::type_id<char>(), "what?");

    std::cout<<ctti::nameof<int>()<<std::endl;
    std::cout<<ctti::nameof<foo>()<<std::endl;
    std::cout<<ctti::nameof<decltype(&foo::i)>()<<std::endl;
    std::cout<<ctti::pretty_function::value<decltype(&foo::i), &foo::i>()<<" -> "<<ctti::nameof<CTTI_STATIC_VALUE(&foo::i)>()<<std::endl;
    std::cout<<ctti::pretty_function::value<decltype(bar_enum::FOO), bar_enum::FOO>()<<" -> "<<ctti::nameof<CTTI_STATIC_VALUE(bar_enum::FOO)>()<<std::endl;
    std::cout<<ctti::nameof<CTTI_STATIC_VALUE(&f)>()<<std::endl;
    std::cout<<ctti::nameof<CTTI_STATIC_VALUE(bar_enum::FOO)>()<<std::endl;
    std::cout<<ctti::type_id(std::cout).hash()<<std::endl;
    std::cout<<ctti::unnamed_type_id(std::cin).hash()<<std::endl;
    std::cout<<"sizeof(ctti::type_id_t) = "<<sizeof(ctti::type_id<int>())<<std::endl;
    std::cout<<"sizeof(ctti::unnamed_type_id_t) = "<<sizeof(ctti::unnamed_type_id<int>())<<std::endl;
    std::cin.get();

    return 0;
}



