REM First toolchain will run clean {
set PROJECT_DIR=examples/GTest
set TOOLCHAIN=vs-14-2015
.\jenkins.py --verbose --clear-except || exit /b 1
REM }

REM {
set PROJECT_DIR=examples/qt-widgets
set TOOLCHAIN=vs-14-2015
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-12-2013
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-11-2012
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=mingw
.\jenkins.py --verbose --upload --nocreate || exit /b 1
REM }

REM {
set PROJECT_DIR=examples/qt-camera
set TOOLCHAIN=vs-14-2015
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-12-2013
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-11-2012
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=mingw
.\jenkins.py --verbose --upload --nocreate || exit /b 1
REM }

REM {
set PROJECT_DIR=examples/qt-location
set TOOLCHAIN=vs-14-2015
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-12-2013
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-11-2012
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=mingw
.\jenkins.py --verbose --upload --nocreate || exit /b 1
REM }

REM {
set PROJECT_DIR=examples/qt-qml
set TOOLCHAIN=vs-14-2015
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-12-2013
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=vs-11-2012
.\jenkins.py --verbose --upload --nocreate || exit /b 1
set TOOLCHAIN=mingw
.\jenkins.py --verbose --upload --nocreate || exit /b 1
REM }
