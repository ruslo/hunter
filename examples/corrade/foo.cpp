// Copy of https://raw.githubusercontent.com/mosra/corrade/master/src/examples/interconnect/main.cpp
/*
    This file is part of Corrade.

    Original authors — credit is appreciated but not required:

        2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018
            — Vladimír Vondruš <mosra@centrum.cz>

    This is free and unencumbered software released into the public domain.

    Anyone is free to copy, modify, publish, use, compile, sell, or distribute
    this software, either in source code form or as a compiled binary, for any
    purpose, commercial or non-commercial, and by any means.

    In jurisdictions that recognize copyright laws, the author or authors of
    this software dedicate any and all copyright interest in the software to
    the public domain. We make this dedication for the benefit of the public
    at large and to the detriment of our heirs and successors. We intend this
    dedication to be an overt act of relinquishment in perpetuity of all
    present and future rights to this software under copyright law.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include <string>
#include <Corrade/Interconnect/Emitter.h>
#include <Corrade/Interconnect/Receiver.h>
#include <Corrade/Utility/Debug.h>

using namespace Corrade;

class RemoteControl: public Interconnect::Emitter {
    public:
        Signal triggered(const std::string& password, int timeout) {
            return emit(&RemoteControl::triggered, password, timeout);
        }
};

class Bomb: public Interconnect::Receiver {
    public:
        void launch(const std::string& password, int timeout);
};

void Bomb::launch(const std::string& password, int timeout) {
    if(password != "terrorist69") {
        Utility::Error{} << "Wrong password. No apocalypse will be performed.";
        return;
    }

    Utility::Warning{} << "Launching bomb in" << timeout << "seconds.";

    // ...

    delete this; // commit suicide
}

int main() {
    RemoteControl rc;
    Bomb *bomb1 = new Bomb,
         *bomb2 = new Bomb,
         *bomb3 = new Bomb;

    Interconnect::connect(rc, &RemoteControl::triggered, *bomb1, &Bomb::launch);
    Interconnect::connect(rc, &RemoteControl::triggered, *bomb2, &Bomb::launch);
    Interconnect::connect(rc, &RemoteControl::triggered, *bomb3, &Bomb::launch);

    Utility::Debug{} << "Successfully installed" << rc.signalConnectionCount()
                     << "bombs.";

    rc.triggered("terrorist69", 60); // Launch all connected bombs after 60 seconds

    if(rc.signalConnectionCount())
        Utility::Fatal{1} << "Mission failed!" << rc.signalConnectionCount()
                          << "bombs didn't explode!";

    Utility::Debug{} << "Mission succeeded!";
}
