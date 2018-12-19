#include <vectorial/vectorial.h>

int main(){
    using vectorial::vec4f;
    using vectorial::normalize;

    vec4f v = normalize( vec4f(1,2,3,4));
    float z = v.z();
}
