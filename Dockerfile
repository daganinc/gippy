FROM ubuntu:20.04

WORKDIR /build
COPY . /build
RUN ./install.sh

