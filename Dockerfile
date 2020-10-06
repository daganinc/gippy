FROM ubuntu:20.04
# developmentseed/geolambda:1.0.0

WORKDIR /build
COPY . /build
RUN ./install.sh

