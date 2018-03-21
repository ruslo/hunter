#include <cvsteer/SteerableFiltersG2.h>

int main() {
    cv::Mat1f image = cv::Mat1f::zeros(128, 128);
    fa::SteerableFiltersG2 filters(image, 4, 0.67f);
}
