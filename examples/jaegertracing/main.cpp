#include <jaegertracing/Tracer.h>

int main()
{
    jaegertracing::Tracer::make("test", jaegertracing::Config());
    return 0;
}
