#if __APPLE__
#include <OpenCL/cl.h>
#else
#include <CL/cl.h>
#endif

#include <CL/cl.hpp>

int main()
{
    std::vector<cl::Platform> platforms;

    cl::Platform::get(&platforms);
    return 0;
}



