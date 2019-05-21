#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgcodecs.hpp>

#include <iostream>
#include <sstream>

int main(int argc, char **argv)
{
  if(argc != 3)
  {
    std::cerr << "Incorrect number of arguments: " << argc << std::endl;
    return EXIT_FAILURE;
  }

  std::cout <<  "open " << argv[1] << std::endl;
  cv::VideoCapture video(argv[1]);

  if(!video.isOpened())
  {
    std::cerr << "Failed to open" << std::endl;
    return EXIT_FAILURE;
  }

  const std::string dir = argv[2];
  std::cout << "Writing to directory: " << dir << std::endl;

  std::ostringstream filename;

  for(int i=0;;++i)
  {
    cv::Mat frame;
    video >> frame;
    if(frame.empty())
    {
      break;
    }

    filename.str("");
    filename << dir << "/frame-" << i << ".png";

    std::cout << frame.cols << " x " << frame.rows << " mean "
        << cv::mean(frame) << " to file: " << filename.str() << std::endl;

    cv::imwrite(filename.str(), frame);
  }

  return EXIT_SUCCESS;
}
