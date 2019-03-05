// https://github.com/google/sentencepiece/blob/master/doc/api.md#load-sentencepiece-model

#include <sentencepiece_processor.h>
#include <iostream>

int main()
{
  sentencepiece::SentencePieceProcessor processor;
  const auto status = processor.Load("//path/to/model.model");
  if (!status.ok())
  {
    std::cerr << status.ToString() << std::endl;
    // error
  }
}
