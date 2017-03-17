#!/bin/bash -e

function wrong_dir() {
  echo "Please run script from 'docs' directory"
  exit 1
}

[ -f "`pwd`/jenkins.sh" ] || wrong_dir

venv_dir="`pwd`/_venv"
src="${venv_dir}/bin/activate"

if [ ! -f "${src}" ];
then
  virtualenv "${venv_dir}"
fi

source "${src}"

which python
python --version

which pip
pip --version

pip install -U pip
pip install -r requirements.txt

rm -rf _build _static _spelling

mkdir _static

sphinx-build -v -W . _build
sphinx-build -b spelling . _spelling
