#include <pugixml.hpp>
#include <cassert>
#include <cstring>

int main(int argc, char *argv[]) {
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file("test.xml");
    assert(result);
    assert(strcmp(doc.child_value("root"), "Hello world!") == 0);
}
