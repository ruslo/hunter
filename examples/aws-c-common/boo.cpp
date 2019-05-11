#include <aws/common/common.h>
#include <aws/common/string.h>

int main() {
    struct aws_allocator *allocator = aws_default_allocator();
    struct aws_string *s = aws_string_new_from_c_str(allocator, "hello world");
    aws_string_destroy(s);
}
