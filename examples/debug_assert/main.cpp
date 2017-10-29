#include "debug_assert.hpp"

#include <iostream>
#include <csignal>

//=== module A ===//
#define MODULE_A_LEVEL 1 // macro to control assertion level
// usually set by the build system

// tag type that defines a module 
struct module_a
: debug_assert::default_handler, // it uses the default handler
  debug_assert::set_level<MODULE_A_LEVEL> // and this level
{};

void module_a_func(void* ptr)
{
    DEBUG_ASSERT(ptr, module_a{}); // minimal assertion
    DEBUG_ASSERT(2 + 2 == 4, module_a{}, debug_assert::level<2>{}); // assertion with level
    DEBUG_ASSERT(1 == 0, module_a{}, "this should be true"); // assertion with additional parameters, i.e. a message
    DEBUG_UNREACHABLE(module_a{}); // mark unreachable statements
}

//=== module B ===//
#define MODULE_B_LEVEL 2

struct module_b
: debug_assert::set_level<MODULE_B_LEVEL>// b uses all assertions with level <= 2
{
    // module b uses a different handler
    // it does not support a message
    // instead you can specify a pointer value
    static void handle(const debug_assert::source_location& loc, const char* expression, void* ptr = nullptr)
    {
        std::cerr << "Assertion failure '" << loc.file_name << ':' << loc.line_number << ": " << expression;
        if (ptr)
            std::cerr << " - pointer is " << ptr;
        std::cerr << '\n';
    }
};

void module_b_func(int &value, void* ptr)
{
    DEBUG_ASSERT(ptr == &value, module_b{}, ptr); // uses the additional custom parameter
    DEBUG_ASSERT(ptr == &value, module_b{}, debug_assert::level<2>{}, ptr); // also works with a custom level
}

int main()
{
    auto old_handler = std::signal(SIGABRT, [](int signal)
    {
        if(signal == SIGABRT)
        {
            std::cerr << "Please never call std::abort() in production :)";
            std::exit(EXIT_SUCCESS);
        }
    });

    if(old_handler == SIG_ERR)
    {
        std::cerr << "Error settings custom SIGABRT handler";
        return EXIT_FAILURE;
    }

    module_a_func(nullptr);
    int val = 5;
    module_b_func(val, &val);
}