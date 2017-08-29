REM {
set TOOLCHAIN=vs-14-2015-sdk-8-1
set PROJECT_DIR=examples/LLVM
.\jenkins.py --verbose --upload --clear-except-download || exit /b 1
REM }
