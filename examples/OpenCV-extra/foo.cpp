// http://docs.opencv.org/doc/tutorials/introduction/linux_gcc_cmake/linux_gcc_cmake.html

#include <stdio.h>
#include <opencv2/opencv.hpp>
#include <opencv2/xfeatures2d.hpp>

int main(int argc, char** argv) {
  if (argc != 2) {
    printf("usage: DisplayImage.out <Image_Path>\n");
    return -1;
  }

  cv::Mat image;
  image = cv::imread(argv[1], 1);

  if (!image.data) {
    printf("No image data \n");
    return EXIT_FAILURE;
  }
  cv::namedWindow("Display Image", cv::WINDOW_AUTOSIZE);
  cv::imshow("Display Image", image);

  cv::waitKey(0);

  return EXIT_SUCCESS;
}
