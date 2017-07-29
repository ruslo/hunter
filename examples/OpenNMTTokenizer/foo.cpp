#include <iostream>
#include <onmt/Tokenizer.h>

int main() {
  onmt::ITokenizer* tokenizer(0);
  std::string line;
  if (false) {
    // Just check API
    std::cout << tokenizer->tokenize(line);
  }
}
