#include <iostream>

#include <unicode/utypes.h>
#include <unicode/unistr.h>

int main()
{
  const std::string greek_utf8 = "γεια σας";
  const icu::UnicodeString greek = icu::UnicodeString::fromUTF8(greek_utf8);

  if (greek.countChar32() != 8)
  {
    std::cerr << "Sanity check failed" << std::endl;
    return 1;
  }
}
