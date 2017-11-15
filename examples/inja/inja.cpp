#include <nlohmann/json.hpp>
#include <inja.hpp>

using json = nlohmann::json;
using Type = inja::Parser::Type;

int main() {
    inja::Parser parser = inja::Parser();
    std::string test = "lorem ipsum";
    json result = {{{"type", Type::String}, {"text", "lorem ipsum"}}};
    bool test = parser.parse(test) == result;
    return 0;
}
