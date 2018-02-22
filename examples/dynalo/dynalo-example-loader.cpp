#include <dynalo/dynalo.hpp>

#include <cstdint>
#include <sstream>

// usage: loader "path/to/shared/lib/dir"
int main(int argc, char* argv[])
{
    // @see https://github.com/maddouri/dynalo
    dynalo::library lib(std::string(argv[1]) + "/" + dynalo::to_native_name("shared"));

    auto add_integers  = lib.get_function<int32_t(const int32_t, const int32_t)>("add_integers");
    auto print_message = lib.get_function<void(const char*)>("print_message");

    std::ostringstream oss;
    oss << "it works: " << add_integers(1, 2);
    print_message(oss.str().c_str());
}
