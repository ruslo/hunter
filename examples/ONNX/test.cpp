#include "onnx/string_utils.h"
#include <string>
#include <stdlib.h>

int main() {
    std::string ret = ONNX_NAMESPACE::to_string(0);
    return atoi(ret.c_str());
}
