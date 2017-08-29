#include <tesseract/baseapi.h>
#include <leptonica/allheaders.h>

int main()
{
    tesseract::TessBaseAPI *api = new tesseract::TessBaseAPI();
    api->End();

    return 0;
}
