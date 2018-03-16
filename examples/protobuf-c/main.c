#include <protobuf-c/protobuf-c.h>
#include "person.pb-c.h"

int main()
{
    Person person = PERSON__INIT;
    return (int) protobuf_c_version_number();
}
