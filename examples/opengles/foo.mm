#import <OpenGLES/ES2/gl.h>

#include <sstream> // std::stringstream

static void check_gl_error()
{
    auto e = glGetError();
    if (e != GL_NO_ERROR)
    {
        std::stringstream ss;
        ss << "OpenGL error: " << int(e);
        throw std::runtime_error(ss.str());
    }
}

int main() {
  check_gl_error();
}
