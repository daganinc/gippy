FROM developmentseed/geolambda:1.0.0

WORKDIR /build
COPY . /build
RUN ./install.sh

# dunno if the clean & rm actions are needed for a dev/test/ci build that's done in place:
# git clean -xfd && pip3 install . && rm -rf /build/*