#include <net.h>

int main() {
    ncnn::Net squeezenet;
    squeezenet.load_param("squeezenet_v1.1.param");
    squeezenet.load_model("squeezenet_v1.1.bin");
    return 0;
}
