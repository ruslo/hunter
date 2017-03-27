#include <random>
#include <imshow/imshow.h>

int main(int argc, char * argv[])
{
  int test[320 * 240];
  unsigned char test8[320 * 240];
  unsigned char test_blur[320 * 240];

  std::default_random_engine eng;
  std::uniform_int_distribution<> dist;

  do
  {
    for (int i = 0; i < 320 * 240; i++)
    {
      test[i] = dist(eng);
    }
    glfw::imshow("test", { test, glfw::IM_8U, 320, 240, 4 });
    for (int i = 0; i < 320 * 240; i++)
    {
      test8[i] = ((test[i] & 0xFF00 >> 8) + (test[i] & 0xFF0000 >> 16) + (test[i] & 0xFF000000 >> 24))/3;
    }
    glfw::imshow("test8", { test8, glfw::IM_8U, 320, 240, 1 });

    for (int y = 1; y < 239; y++)
    {
      for (int x = 1; x < 319; x++)
      {
        test_blur[y * 320 + x] = (test8[y * 320 + x-1] + test8[y * 320 + x] + test8[y * 320 + x+1]) / 3;
      }
    }
    for (int y = 1; y < 239; y++)
    {
      for (int x = 1; x < 319; x++)
      {
        test_blur[y * 320 + x] = (test_blur[(y - 1) * 320 + x] + test_blur[y * 320 + x] + test_blur[(y + 1) * 320 + x]) / 3;
      }
    }
    glfw::imshow("test_blured", { test_blur, glfw::IM_8U, 320, 240, 1 });
  }
  while (glfw::getKey(false) != 'q');

  return 0;
}
