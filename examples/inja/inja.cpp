#include <nlohmann/json.hpp>
#include <inja.hpp>

int main() {
    inja::Parser parser = inja::Parser();
    std::string test = "lorem ipsum";
    nlohmann::json result = {{{"type", inja::Parser::Type::String}, {"text", "lorem ipsum"}}};
    bool tested = (parser.parse(test) == result);
    return 0;
}
