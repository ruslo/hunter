#!/bin/bash -e

set -x

mkdir -p _static

sphinx-build -v . _build

set +x

echo "Done:"
echo "`pwd`/_build/index.html"
