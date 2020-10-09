#!/bin/bash

set -ev

. /etc/lsb-release

# Only supported for ubuntu 20.04;  Older versions require ubuntugis ppa
[ "${DISTRIB_ID}" = "Ubuntu" -a "${DISTRIB_RELEASE}" = "20.04" ]

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
# Not needed for 20.04, but might be on other versions
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:ubuntugis/ppa
apt-get -y update
apt-get install -y \
        python3  python3-dev \
        libgdal-dev  python-is-python3  \
        swig  wget  curl build-essential
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip3 install -r requirements.txt
pip3 install -r requirements-dev.txt
pip3 install . --no-cache
apt-get -y autoclean

