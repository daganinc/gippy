ARG BASE_IMAGE="ubuntu:20.04"

FROM $BASE_IMAGE

ARG UBUNTUGIS_PPA=""


WORKDIR /build
COPY . /build
RUN export UBUNTUGIS_PPA="$UBUNTUGIS_PPA";  ./install.sh 

