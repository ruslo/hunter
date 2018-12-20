#include <SimpleSignal/SimpleSignal.h>

#include <string>
#include <stdarg.h>
#include <time.h>
#include <ctime>
#include <cstdlib>
#include <cassert>

#ifndef _MSC_VER
#include <sys/time.h>
#include <stdio.h>
static std::string string_printf (const char *format, ...) __attribute__ ((__format__ (__printf__, 1, 2)));
#endif

static std::string accu;

static std::string string_printf (const char *format, ...)
{
    std::string result;
    char str[1000];
    va_list args;
    va_start (args, format);
    if (vsnprintf (str, sizeof str, format, args) >= 0)
      result = str;
    va_end (args);
    return result;
}

static char float_callback (float f, int, std::string)
{
    accu += string_printf ("float: %.2f\n", f);
    return 0;
}

int main() {
    Simple::Signal<char (float, int, std::string)> sig1;
    size_t id1 = sig1.connect(float_callback);
    sig1.emit (.3f, 4, "huhu");
    sig1.disconnect(id1);
}
