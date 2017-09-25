REM {
set TOOLCHAIN=vs-14-2015-sdk-8-1
set PROJECT_DIR=examples/qt-widgets
.\jenkins.py --clear-except-download || exit /b 1
set PROJECT_DIR=examples/qt-core
.\jenkins.py --nocreate || exit /b 1
set PROJECT_DIR=examples/qt-qml
.\jenkins.py --nocreate || exit /b 1
set PROJECT_DIR=examples/qt-location
.\jenkins.py --nocreate || exit /b 1
set PROJECT_DIR=examples/qt-camera
.\jenkins.py --upload --nocreate || exit /b 1
REM }
