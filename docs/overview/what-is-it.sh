#!/bin/bash -e

rm -f v0.14.5.tar.gz
rm -rf hunter-0.14.5

# doc: download-start
wget https://github.com/ruslo/hunter/archive/v0.14.5.tar.gz
tar xf v0.14.5.tar.gz
# doc: download-end

# doc: version-start
grep -A3 -m3 VERSION hunter-0.14.5/cmake/projects/OpenSSL/hunter.cmake
# doc: version-end

# doc: install-start
grep -A1 INSTALL_COMMAND hunter-0.14.5/cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in
# doc: install-end

# doc: default-start
grep '\<OpenSSL\>' -m1 hunter-0.14.5/cmake/configs/default.cmake
# doc: default-stop

rm -f v0.14.5.tar.gz
rm -rf hunter-0.14.5
