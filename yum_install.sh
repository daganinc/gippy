#!/bin/bash

# TODO tied for now to `FROM developmentseed/geolambda:1.0.0`; see Dockerfile

set -ev

yum install -y swig

# setup & install python env
python3 -m venv ~/venv
source ~/venv/bin/activate
pip install --upgrade pip # honestly just to make the warnings go away

# install gippy itself
# TODO shouldn't need to install requirements files; they're in setup.py already
pip install -r requirements.txt
pip install -r requirements-dev.txt
pip install . --no-cache # not sure if need -e

# pytest --cov gippy # last circleci thing before it exits TODO
