#include <iostream>

#include <boost/regex.hpp>
#include <boost/regex/icu.hpp>

#include <unicode/unistr.h>

// https://www.boost.org/doc/libs/1_69_0/libs/regex/doc/html/boost_regex/ref/non_std_strings/icu/unicode_algo.html#boost_regex.ref.non_std_strings.icu.unicode_algo.u32regex_search
icu::UnicodeString extract_greek(const icu::UnicodeString& text)
{
  // searches through some UTF-16 encoded text for a block encoded in Greek,
  // this expression is imperfect, but the best we can do for now - searching
  // for specific scripts is actually pretty hard to do right.
  //
  // Here we search for a character sequence that begins with a Greek letter,
  // and continues with characters that are either not-letters ( [^[:L*:]] )
  // or are characters in the Greek character block ( [\\x{370}-\\x{3FF}] ).
  //
  boost::u32regex r = boost::make_u32regex(
      L"[\\x{370}-\\x{3FF}](?:[^[:L*:]]|[\\x{370}-\\x{3FF}])*"
  );
  boost::u16match what;

  if(boost::u32regex_search(text, what, r))
  {
    // extract $0 as a CString:
    return icu::UnicodeString(what[0].first, what.length(0));
  }

  return icu::UnicodeString();
}

int main()
{
  const std::string greek_utf8 = "γεια σας";
  const std::string greek_surround_utf8 = "prefix" + greek_utf8 + "suffix";
  const std::string english_utf8 = "hello";
  const std::string english_japanese_utf8 = english_utf8 + "こんにちは";

  const icu::UnicodeString greek = icu::UnicodeString::fromUTF8(greek_utf8);
  const icu::UnicodeString greek_surround = icu::UnicodeString::fromUTF8(greek_surround_utf8);
  const icu::UnicodeString english = icu::UnicodeString::fromUTF8(english_utf8);
  const icu::UnicodeString english_japanese = icu::UnicodeString::fromUTF8(english_japanese_utf8);

  if (greek.countChar32() != 8)
  {
    std::cerr << "Sanity check failed" << std::endl;
    return 1;
  }

  const icu::UnicodeString test_1 = extract_greek(greek);

  if (test_1 != greek)
  {
    std::cerr << "Test 1 failed" << std::endl;
    return 1;
  }

  const icu::UnicodeString test_2 = extract_greek(greek_surround);

  if (test_2 != greek)
  {
    std::cerr << "Test 2 failed" << std::endl;
    return 1;
  }

  const icu::UnicodeString test_3 = extract_greek(english);

  if (!test_3.isEmpty())
  {
    std::cerr << "Test 3 failed" << std::endl;
    return 1;
  }

  const icu::UnicodeString test_4 = extract_greek(english_japanese);

  if (!test_4.isEmpty())
  {
    std::cerr << "Test 4 failed" << std::endl;
    return 1;
  }

  std::cout << "Test passed" << std::endl;
}
