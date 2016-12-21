#if __APPLE__
#include <OpenCL/cl.h>
#else
#include <CL/cl.h>
#endif

int main()
{
    cl_platform_id platform_id = NULL;
    cl_uint ret_num_platforms;

    clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
    return 0;
}



