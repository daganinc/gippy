#!/bin/bash

set -ev

. /etc/lsb-release

# Older Ubuntu versions may need ubuntugis ppa (Set UBUNTUGIS_PPA=FALSE to try
# w/o)
declare -i ubu_maj_ver=$(echo ${DISTRIB_RELEASE} | cut -d. -f1)
if [ "${DISTRIB_ID}" = "Ubuntu" ] ; then
    if [ ${ubu_maj_ver} -gt 19 ] ; then
        EXTRA_PACKAGES=python-is-python3
    fi
else
    echo "Haven't worked on supporting ${DISTRIB_ID} yet."
    exit 222
fi

echo "UBUNTUGIS_PPA: \"${UBUNTUGIS_PPA}\""

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
# Not needed for 20.04, but might be on older versions
if [ "${UBUNTUGIS_PPA%%:*}" = "ppa" ] ; then
    apt-get install -y software-properties-common
    add-apt-repository -y ${UBUNTUGIS_PPA}
    apt-get -y update
fi
apt-get install -y \
        python3  python3-dev \
        libgdal-dev swig  wget \
        curl build-essential ${EXTRA_PACKAGES}
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip3 install -r requirements.txt
pip3 install -r requirements-dev.txt
pip3 install . --no-cache
apt-get -y autoclean

